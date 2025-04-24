import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncMovieItemModel extends NguoncMovieItemEntity {
  NguoncMovieItemModel({
    required super.id,
    required super.name,
    required super.slug,
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
    required super.originalName,
    required super.time,
    required super.director,
  });

  factory NguoncMovieItemModel.fromJson(Map<String, dynamic> json) =>
      NguoncMovieItemModel(
        id: json["id"],
        name: json["name"] ?? AppConstants.noData,
        slug: json["slug"] ?? AppConstants.noData,
        originalName: json["original_name"] ?? AppConstants.noData,
        thumbUrl: json["thumb_url"] ?? AppConstants.noData,
        posterUrl: json["poster_url"] ?? AppConstants.noData,
        created: json["created"] ?? AppConstants.noData,
        modified: json["modified"] ?? AppConstants.noData,
        description: json["description"] ?? AppConstants.noData,
        totalEpisodes: json["total_episodes"] ?? AppConstants.noData,
        currentEpisode: json["current_episode"] ?? AppConstants.noData,
        quality: json["quality"] ?? AppConstants.noData,
        language: json["language"] ?? AppConstants.noData,
        time: json["time"] ?? AppConstants.noData,
        casts: json["casts"] ?? AppConstants.noData,
        director: json["director"] ?? AppConstants.noData,
      );
}
