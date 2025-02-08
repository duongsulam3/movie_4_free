import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

abstract interface class SeriesMovieRepository {
  Future<Either<Failure, List<MovieItemEntity>>> getSeriesMovie();
}
