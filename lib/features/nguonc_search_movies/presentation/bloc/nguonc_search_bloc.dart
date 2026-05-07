import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/utils/enum/search/search_page_status.dart';
import '../../domain/entity/nguonc_movie_item_entity.dart';
import '../../domain/entity/nguonc_search_suggestion_entity.dart';
import '../../domain/usecase/nguonc_get_search_films.dart';
import '../../domain/usecase/nguonc_get_search_suggestions.dart';

part 'nguonc_search_event.dart';
part 'nguonc_search_state.dart';
part 'nguonc_search_bloc.freezed.dart';

class NguoncSearchBloc extends Bloc<NguoncSearchEvent, NguoncSearchState> {
  final NguoncGetSearchFilms getSearchFilms;
  final NguoncGetSearchSuggestions getSearchSuggestions;
  final Debouncer _suggestionDebouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  NguoncSearchBloc({
    required this.getSearchFilms,
    required this.getSearchSuggestions,
  }) : super(const NguoncSearchState()) {
    on<GetSearchFilmsEvent>(fetchSearchFilms);
    on<SearchNguoncQueryChangedEvent>(onSearchQueryChanged);
    on<FetchNguoncSearchSuggestionsEvent>(fetchSearchSuggestions);
    on<ClearNguoncSearchSuggestionsEvent>(clearSearchSuggestions);
  }

  Future<void> fetchSearchFilms(
    GetSearchFilmsEvent event,
    Emitter<NguoncSearchState> emit,
  ) async {
    _suggestionDebouncer.dispose();
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

    List<NguoncMovieItemEntity> movies = const [];
    final res = await getSearchFilms.call(
      NguoncGetSearchFilmsParams(query: event.query, page: state.page),
    );

    res.fold(
      (err) => emit(state.copyWith(status: SearchPageStatus.error)),
      (data) {
        movies = data;
        if (movies.length < 10) {
          emit(
            state.copyWith(
              status: SearchPageStatus.success,
              movies: state.query == event.query
                  ? [...state.movies, ...movies]
                  : movies,
              query: event.query,
              typingQuery: event.query,
              suggestions: const [],
              isSuggestionLoading: false,
              isEnd: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: SearchPageStatus.success,
              movies: state.query == event.query
                  ? [...state.movies, ...movies]
                  : movies,
              query: event.query,
              typingQuery: event.query,
              suggestions: const [],
              isSuggestionLoading: false,
              page: state.page + 1,
            ),
          );
        }
      },
    );
  }

  Future<void> onSearchQueryChanged(
    SearchNguoncQueryChangedEvent event,
    Emitter<NguoncSearchState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(
        state.copyWith(
          status: SearchPageStatus.init,
          typingQuery: "",
          suggestions: const [],
          isSuggestionLoading: false,
        ),
      );
      return;
    }

    emit(state.copyWith(
      status: SearchPageStatus.suggestions,
      typingQuery: query,
      isSuggestionLoading: true,
    ));

    // Debounce suggestion fetching to avoid rapid API calls while typing.
    _suggestionDebouncer.run(() {
      add(FetchNguoncSearchSuggestionsEvent(query: query));
    });
  }

  Future<void> fetchSearchSuggestions(
    FetchNguoncSearchSuggestionsEvent event,
    Emitter<NguoncSearchState> emit,
  ) async {
    final requestQuery = event.query.trim();
    if (requestQuery.isEmpty) {
      emit(state.copyWith(
        status: SearchPageStatus.init,
        suggestions: const [],
        isSuggestionLoading: false,
      ));
      return;
    }

    final res = await getSearchSuggestions.call(
      NguoncSearchSuggestionParams(
        query: requestQuery,
        limit: event.limit,
      ),
    );

    if (requestQuery != state.typingQuery.trim()) return;

    res.fold(
      (_) => emit(state.copyWith(
        status: SearchPageStatus.suggestions,
        suggestions: const [],
        isSuggestionLoading: false,
      )),
      (data) => emit(state.copyWith(
        status: SearchPageStatus.suggestions,
        suggestions: data,
        isSuggestionLoading: false,
      )),
    );
  }

  void clearSearchSuggestions(
    ClearNguoncSearchSuggestionsEvent event,
    Emitter<NguoncSearchState> emit,
  ) {
    _suggestionDebouncer.dispose();
    emit(state.copyWith(
      status: SearchPageStatus.init,
      typingQuery: "",
      suggestions: const [],
      isSuggestionLoading: false,
    ));
  }

  @override
  Future<void> close() {
    _suggestionDebouncer.dispose();
    return super.close();
  }
}
