import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncMoviesByCategoryItemEntity extends NguoncMovieItemEntity {
  NguoncMoviesByCategoryItemEntity({
    required super.id,
    required super.name,
    required super.slug,
    required super.originalName,
    required super.thumbUrl,
    required super.posterUrl,
    required super.created,
    required super.modified,
    required super.description,
    required super.totalEpisodes,
    required super.currentEpisode,
    required super.quality,
    required super.language,
    required super.casts,
    required super.time,
    required super.director,
  });
}
