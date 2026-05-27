import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';

abstract interface class RecentlyUpdateMoviesRepository {
  Future<List<RecentlyUpdateListItemEntity>> getCachedRecentlyUpdateMovies();

  /// Returns [null] when remote data equals Hive cache (no save, no UI update).
  Future<Either<Failure, List<RecentlyUpdateListItemEntity>?>>
      getRecentlyUpdateMovies();
}
