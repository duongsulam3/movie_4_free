import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_movies.dart';

part 'movies_bloc.freezed.dart';
part 'movies_event.dart';
part 'movies_state.dart';

enum MoviesStateStatus { init, success, error }

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovies getMovies;
  MoviesBloc({required this.getMovies}) : super(const MoviesState()) {
    List<MovieItemEntity> movies = const <MovieItemEntity>[];
    on<GetListMovies>((event, emit) async {
      try {
        if (state.isEnd) return;
        final res = await getMovies.call(
          GetMoviesParams(
            page: state.page,
            cateName: event.path,
            limit: event.limit,
          ),
        );
        res.fold(
          (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
          (data) {
            if (data.isNotEmpty) {
              movies = data;
              emit(state.copyWith(
                status: MoviesStateStatus.success,
                movies: [...state.movies, ...movies],
                isEnd: event.isRefresh == false ? true : false,
                page: state.page + 1,
              ));
            } else {
              emit(state.copyWith(isEnd: true));
            }
          },
        );
      } catch (e) {
        emit(state.copyWith(status: MoviesStateStatus.error));
      }
    });
  }
}
