import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/kho_phim/data/model/kho_phim_category_model.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/categories_repository.dart';
import 'package:smoth_movie_app/features/kho_phim/data/source/remote/categories_remote_data_source.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  const CategoriesRepositoryImpl(this.categoriesRemoteDataSource);
  @override
  Future<Either<Failure, List<KhoPhimCategoryModel>>> getCategories() async {
    try {
      final res = await categoriesRemoteDataSource.getCategories();
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
