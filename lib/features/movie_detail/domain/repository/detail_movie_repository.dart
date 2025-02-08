import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';


abstract interface class DetailMovieRepository {
  Future<Either<Failure, MovieDetailEntity>> getDetailMovie({
    required String slug,
  });
}
