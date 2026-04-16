import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/search/search_page_status.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/search/domain/entities/search_suggestion_entity.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_suggestions.dart';
part 'search_bloc.freezed.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovies getSearchMovies;
  final GetSearchSuggestions getSearchSuggestions;
  Timer? _suggestionDebounce;

  SearchBloc({
    required this.getSearchMovies,
    required this.getSearchSuggestions,
  }) : super(const SearchState()) {
    on<GetSearchMoviesEvent>(fetchSearchMovies);
    on<SearchQueryChangedEvent>(onSearchQueryChanged);
    on<FetchSearchSuggestionsEvent>(fetchSearchSuggestions);
    on<ClearSearchSuggestionsEvent>(clearSearchSuggestions);
  }

  Future<void> fetchSearchMovies(
    GetSearchMoviesEvent event,
    Emitter<SearchState> emit,
  ) async {
    _suggestionDebounce?.cancel();
    if (state.isEnd) {
      emit(state.copyWith(status: SearchPageStatus.success, isEnd: false));
    }
    if (state.query != event.query) {
      emit(state.copyWith(
        status: SearchPageStatus.loading,
        page: 1,
        movies: const [],
      ));
    }
    List<MovieItemEntity> movies = const [];
    final res = await getSearchMovies.call(
      SearchParams(query: event.query, page: state.page, limit: event.limit),
    );
    //** HANDLE SEARCH STATES */
    res.fold(
      (err) => emit(state.copyWith(status: SearchPageStatus.error)),
      (data) {
        movies = data;
        if (movies.length < event.limit) {
          emit(state.copyWith(
            status: SearchPageStatus.success,
            movies: state.query == event.query
                ? [...state.movies, ...movies]
                : movies,
            query: event.query,
            typingQuery: event.query,
            suggestions: const [],
            isSuggestionLoading: false,
            showSuggestions: false,
            isEnd: true,
          ));
        } else {
          emit(state.copyWith(
            status: SearchPageStatus.success,
            movies: state.query == event.query
                ? [...state.movies, ...movies]
                : movies,
            query: event.query,
            typingQuery: event.query,
            suggestions: const [],
            isSuggestionLoading: false,
            showSuggestions: false,
            page: state.page + 1,
          ));
        }
      },
    );
  }

  Future<void> onSearchQueryChanged(
    SearchQueryChangedEvent event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();
    _suggestionDebounce?.cancel();

    if (query.isEmpty) {
      emit(state.copyWith(
        typingQuery: "",
        suggestions: const [],
        isSuggestionLoading: false,
        showSuggestions: false,
      ));
      return;
    }

    // Keep typing state separate from submitted search results.
    emit(state.copyWith(
      typingQuery: query,
      isSuggestionLoading: true,
      showSuggestions: true,
    ));

    _suggestionDebounce = Timer(const Duration(seconds: 1), () {
      add(FetchSearchSuggestionsEvent(query: query));
    });
  }

  Future<void> fetchSearchSuggestions(
    FetchSearchSuggestionsEvent event,
    Emitter<SearchState> emit,
  ) async {
    final requestQuery = event.query.trim();
    if (requestQuery.isEmpty) {
      emit(state.copyWith(
        suggestions: const [],
        isSuggestionLoading: false,
        showSuggestions: false,
      ));
      return;
    }

    final res = await getSearchSuggestions.call(
      SearchSuggestionParams(query: requestQuery, limit: event.limit),
    );

    if (requestQuery != state.typingQuery.trim()) return;

    res.fold(
      (_) => emit(state.copyWith(
        suggestions: const [],
        isSuggestionLoading: false,
        showSuggestions: false,
      )),
      (data) => emit(state.copyWith(
        suggestions: data,
        isSuggestionLoading: false,
        showSuggestions: data.isNotEmpty,
      )),
    );
  }

  void clearSearchSuggestions(
    ClearSearchSuggestionsEvent event,
    Emitter<SearchState> emit,
  ) {
    _suggestionDebounce?.cancel();
    emit(state.copyWith(
      suggestions: const [],
      isSuggestionLoading: false,
      showSuggestions: false,
    ));
  }

  @override
  Future<void> close() {
    _suggestionDebounce?.cancel();
    return super.close();
  }
}
