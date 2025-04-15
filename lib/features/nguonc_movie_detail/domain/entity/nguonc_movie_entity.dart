import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_category_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_episodes_entity.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncMovieEntity extends NguoncMovieItemEntity {
  final List<NguoncCategoryEntity> categories;
  final List<NguoncEpisodesEntity> episodes;
  NguoncMovieEntity({
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
    super.time,
    super.casts,
    super.director,
    required this.categories,
    required this.episodes,
  });
}
