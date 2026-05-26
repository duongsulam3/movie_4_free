import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class MoviesFetchResult {
  const MoviesFetchResult({
    required this.movies,
    required this.hasChangedFromCache,
  });

  final List<MovieItemEntity> movies;
  final bool hasChangedFromCache;
}
