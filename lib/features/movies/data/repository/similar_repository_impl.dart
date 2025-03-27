import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/similar_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/similar_movies_repository.dart';

class SimilarRepositoryImpl implements SimilarMoviesRepository {
  final SimilarMoviesRemoteDataSource remoteDataSource;
  const SimilarRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<MovieItemEntity>>> getSimilarMovies({
    required String categorySlug,
  }) async {
    try {
      final res = await remoteDataSource.getSimilarMovies(
        categorySlug: categorySlug,
      );
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
