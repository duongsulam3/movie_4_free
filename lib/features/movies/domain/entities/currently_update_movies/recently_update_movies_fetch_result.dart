import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';

class RecentlyUpdateMoviesFetchResult {
  const RecentlyUpdateMoviesFetchResult({
    required this.movies,
    required this.hasChangedFromCache,
  });

  final List<RecentlyUpdateListItemEntity> movies;
  final bool hasChangedFromCache;
}
