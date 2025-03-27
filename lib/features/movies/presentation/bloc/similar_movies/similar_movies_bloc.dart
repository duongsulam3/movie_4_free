import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_similar_movies.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';
part 'similar_movies_bloc.freezed.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  final GetSimilarMovies getSimilarMovies;
  SimilarMoviesBloc(this.getSimilarMovies) : super(const SimilarMoviesState()) {
    on<FetchMovies>((event, emit) async {
      List<MovieItemEntity> movies = const [];
      final res = await getSimilarMovies.call(GetSimilarMoviesParams(
        categorySlug: event.categorySlug,
      ));
      res.fold(
        (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
        (data) {
          movies = data;
          emit(state.copyWith(
            status: MoviesStateStatus.success,
            movies: movies,
          ));
        },
      );
    });
  }
}
