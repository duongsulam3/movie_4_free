import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/entity/nguonc_movies_by_category_item_entity.dart';

abstract interface class NguoncMoviesByCateRepository {
  Future<Either<Failure, List<NguoncMoviesByCategoryItemEntity>>>
      getMoviesByCate({
    required String slug,
    required int page,
  });
}
