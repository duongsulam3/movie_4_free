import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/search/search_page_status.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
part 'search_bloc.freezed.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovies getSearchMovies;
  SearchBloc({required this.getSearchMovies}) : super(const SearchState()) {
    on<GetSearchMoviesEvent>(fetchSearchMovies);
  }

  Future<void> fetchSearchMovies(
    GetSearchMoviesEvent event,
    Emitter<SearchState> emit,
  ) async {
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
            isEnd: true,
          ));
        } else {
          emit(state.copyWith(
            status: SearchPageStatus.success,
            movies: state.query == event.query
                ? [...state.movies, ...movies]
                : movies,
            query: event.query,
            page: state.page + 1,
          ));
        }
      },
    );
  }
}
