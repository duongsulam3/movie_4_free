import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/source/local/home_movies_cache_compare.dart';
import 'package:smoth_movie_app/features/movies/data/source/local/home_movies_local_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/recently_update_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/recently_update_movies_repository.dart';

class RecentlyUpdateMoviesRepositoryImpl
    implements RecentlyUpdateMoviesRepository {
  final RecentlyUpdateMoviesRemoteDataSource
      recentlyUpdateMoviesRemoteDataSource;
  final HomeMoviesLocalDataSource homeMoviesLocalDataSource;
  const RecentlyUpdateMoviesRepositoryImpl({
    required this.recentlyUpdateMoviesRemoteDataSource,
    required this.homeMoviesLocalDataSource,
  });

  @override
  Future<List<RecentlyUpdateListItemModel>>
      getCachedRecentlyUpdateMovies() async {
    return homeMoviesLocalDataSource.getRecentlyUpdated();
  }

  @override
  Future<Either<Failure, List<RecentlyUpdateListItemEntity>?>>
      getRecentlyUpdateMovies() async {
    try {
      // fetch remote data
      final result =
          await recentlyUpdateMoviesRemoteDataSource.getRecentlyUpdateMovies();

      // fetch cached data
      final oldCache = await homeMoviesLocalDataSource.getRecentlyUpdated();

      // compare new data with cached data
      final isEqual = await HomeMoviesCacheCompare.recentlyEquals(
        oldCache,
        result,
      );

      if (isEqual) {
        return const Right(null);
      }

      await homeMoviesLocalDataSource.saveRecentlyUpdated(result);

      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
