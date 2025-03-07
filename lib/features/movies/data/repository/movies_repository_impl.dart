import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  const MoviesRepositoryImpl({required this.moviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  }) async {
    try {
      final res = await moviesRemoteDataSource.getMovies(
        page: page,
        limit: limit,
        cateName: cateName,
      );
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
