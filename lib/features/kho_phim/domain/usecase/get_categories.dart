import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_category_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/categories_repository.dart';

class GetCategories implements UsecaseNoParams {
  final CategoriesRepository categoriesRepository;
  const GetCategories(this.categoriesRepository);
  @override
  Future<Either<Failure, List<KhoPhimCategoryEntity>>> call() async {
    return await categoriesRepository.getCategories();
  }
}
