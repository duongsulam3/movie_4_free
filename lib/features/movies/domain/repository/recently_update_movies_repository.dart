import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_movies_fetch_result.dart';

abstract interface class RecentlyUpdateMoviesRepository {
  Future<List<RecentlyUpdateListItemEntity>> getCachedRecentlyUpdateMovies();

  Future<Either<Failure, RecentlyUpdateMoviesFetchResult>>
      getRecentlyUpdateMovies();
}
