import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/similar_movies_repository.dart';

class GetSimilarMovies
    implements Usecase<List<MovieItemEntity>, GetSimilarMoviesParams> {
  final SimilarMoviesRepository repository;
  const GetSimilarMovies(this.repository);
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call(params) async {
    return await repository.getSimilarMovies(categorySlug: params.categorySlug);
  }
}

class GetSimilarMoviesParams {
  final String categorySlug;
  const GetSimilarMoviesParams({required this.categorySlug});
}
