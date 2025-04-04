import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_category_entity.dart';

abstract interface class CategoriesRepository {
  Future<Either<Failure, List<KhoPhimCategoryEntity>>> getCategories();
}
