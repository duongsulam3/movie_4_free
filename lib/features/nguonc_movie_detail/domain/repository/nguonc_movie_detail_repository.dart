import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';

abstract interface class NguoncMovieDetailRepository {
  Future<Either<Failure, NguoncMovieEntity>> getDetailMovie({
    required String slug,
  });
}
