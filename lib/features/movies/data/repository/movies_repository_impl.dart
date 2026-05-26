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
  Future<Either<Failure, List<MovieItemEntity>>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  }) async {
    try {
      // Fetch movies from remote data source
      final res = await moviesRemoteDataSource.getMovies(
        page: page,
        limit: limit,
        cateName: cateName,
      );

      // Get old cache for comparison
      final oldCache = await homeMoviesLocalDataSource.getMovies(
        cateName: cateName,
        limit: limit,
      );

      // Compare new data with old cache and persist only if they differ
      if (!await HomeMoviesCacheCompare.moviesEquals(oldCache, res)) {
        // Persist only when the fetched data differs from local cache.
        await homeMoviesLocalDataSource.saveMovies(
          cateName: cateName,
          limit: limit,
          movies: List<MovieItemModel>.from(res),
        );
      }

      // Return the fetched movies wrapped in a Right (success) Either
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
