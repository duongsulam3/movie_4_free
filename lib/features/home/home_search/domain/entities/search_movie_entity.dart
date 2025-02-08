import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';

class SearchMovieEntity extends RecentlyUpdateListItemEntity {
  SearchMovieEntity({
    required super.sId,
    required super.name,
    required super.slug,
    required super.originName,
    required super.posterUrl,
    required super.thumbUrl,
    required super.year,
  });
}
