import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/single_movie_remote_data_source.dart';
//Repository implemented from domain
import 'package:smoth_movie_app/features/movies/domain/repository/single_movies_repository.dart';

class SingleMoviesRepositoryImpl implements SingleMoviesRepository {
  final SingleMovieRemoteDataSource singleMovieRemoteDataSource;
  const SingleMoviesRepositoryImpl({required this.singleMovieRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieItemModel>>> getSingleMovies() async {
    try {
      final result = await singleMovieRemoteDataSource.getSingleMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
