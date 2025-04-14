import 'package:smoth_movie_app/features/nguonc_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncMovieItemModel extends NguoncMovieItemEntity {
  NguoncMovieItemModel({
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
  });

  factory NguoncMovieItemModel.fromJson(Map<String, dynamic> json) =>
      NguoncMovieItemModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        originalName: json["original_name"],
        thumbUrl: json["thumb_url"],
        posterUrl: json["poster_url"],
        created: json["created"],
        modified: json["modified"],
        description: json["description"],
        totalEpisodes: json["total_episodes"],
        currentEpisode: json["current_episode"],
        quality: json["quality"],
        language: json["language"],
        time: json["time"].toString(),
        casts: json["casts"].toString(),
        director: json["director"].toString(),
      );
}
