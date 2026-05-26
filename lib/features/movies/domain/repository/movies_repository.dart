import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movies_fetch_result.dart';

abstract interface class MoviesRepository {
  Future<List<MovieItemEntity>> getCachedMovies({
    required int limit,
    required String cateName,
  });

  Future<Either<Failure, MoviesFetchResult>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  });
}
