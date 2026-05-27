import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/source/local/home_movies_cache_compare.dart';
import 'package:smoth_movie_app/features/movies/data/source/local/home_movies_local_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final HomeMoviesLocalDataSource homeMoviesLocalDataSource;
  const MoviesRepositoryImpl({
    required this.moviesRemoteDataSource,
    required this.homeMoviesLocalDataSource,
  });

  @override
  Future<List<MovieItemEntity>> getCachedMovies({
    required int limit,
    required String cateName,
  }) async {
    return homeMoviesLocalDataSource.getMovies(
      cateName: cateName,
      limit: limit,
    );
  }

  @override
  Future<Either<Failure, List<MovieItemEntity>?>> getMovies({
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

      final oldCache = await homeMoviesLocalDataSource.getMovies(
        cateName: cateName,
        limit: limit,
      );

      final isEqual = await HomeMoviesCacheCompare.moviesEquals(
        oldCache,
        res,
      );

      if (isEqual) {
        return const Right(null);
      }

      await homeMoviesLocalDataSource.saveMovies(
        cateName: cateName,
        limit: limit,
        movies: List<MovieItemModel>.from(res),
      );

      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
