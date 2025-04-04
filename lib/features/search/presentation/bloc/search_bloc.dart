import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
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
      emit(state.copyWith(status: MoviesStateStatus.success, isEnd: false));
    }
    List<MovieItemEntity> movies = const [];
    if (state.query != event.query) {
      emit(state.copyWith(page: 1));
    }
    final res = await getSearchMovies.call(
      SearchParams(query: event.query, page: state.page, limit: event.limit),
    );
    //** HANDLE SEARCH STATES */
    res.fold(
      (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
      (data) {
        movies = data;
        if (movies.length < event.limit) {
          emit(state.copyWith(
            status: MoviesStateStatus.success,
            isEnd: true,
            movies: state.query == event.query
                ? [...state.movies, ...movies]
                : movies,
          ));
        } else {
          emit(state.copyWith(
            status: MoviesStateStatus.success,
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
