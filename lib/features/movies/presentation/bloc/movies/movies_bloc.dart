import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_movies.dart';

part 'movies_bloc.freezed.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovies usecase;
  MoviesBloc({required this.usecase}) : super(const MoviesState()) {
    on<GetListMovies>(fetchMovie);
  }

  fetchMovie(
    GetListMovies event,
    Emitter<MoviesState> emit,
  ) async {
    if (state.isEnd) return;
    List<MovieItemEntity> movies = const [];
    final res = await usecase.call(
      GetMoviesParams(
        page: state.page,
        cateName: event.path,
        limit: event.limit,
      ),
    );
    res.fold(
      (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
      (data) {
        movies = data;
        if (movies.length < event.limit) {
          emit(state.copyWith(
            status: MoviesStateStatus.success,
            isEnd: true,
            movies: [...state.movies, ...movies],
          ));
        } else {
          emit(state.copyWith(
            status: MoviesStateStatus.success,
            movies: [...state.movies, ...movies],
            isEnd: event.isRefresh ? false : true,
            page: state.page + 1,
          ));
        }
      },
    );
  }
}
