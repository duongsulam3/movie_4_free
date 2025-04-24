import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/entity/nguonc_movies_by_category_item_entity.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/repository/nguonc_movies_by_cate_repository.dart';

class NguoncGetMoviesByCate
    implements
        Usecase<List<NguoncMoviesByCategoryItemEntity>,
            NguoncGetMoviesByCateParams> {
  final NguoncMoviesByCateRepository repository;
  const NguoncGetMoviesByCate(this.repository);
  @override
  Future<Either<Failure, List<NguoncMoviesByCategoryItemEntity>>> call(
    NguoncGetMoviesByCateParams params,
  ) async {
    return await repository.getMoviesByCate(
      slug: params.slug,
      page: params.page,
    );
  }
}

class NguoncGetMoviesByCateParams {
  final String slug;
  final int page;
  const NguoncGetMoviesByCateParams({required this.slug, required this.page});
}
