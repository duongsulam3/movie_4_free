import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/nguonc_categories/data/model/nguonc_movies_by_category_item_model.dart';
import 'package:smoth_movie_app/features/nguonc_categories/data/source/remote/nguonc_movies_by_category_remote_datasource.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/repository/nguonc_movies_by_cate_repository.dart';

class NguoncMoviesByCateRepositoryImpl implements NguoncMoviesByCateRepository {
  final NguoncMoviesByCategoryRemoteDatasource source;
  const NguoncMoviesByCateRepositoryImpl(this.source);
  @override
  Future<Either<Failure, List<NguoncMoviesByCategoryItemModel>>>
      getMoviesByCate({
    required String slug,
    required int page,
  }) async {
    try {
      final res = await source.getMoviesByCategory(slug, page);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
