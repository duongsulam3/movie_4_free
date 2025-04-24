import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/entity/nguonc_movies_by_category_item_entity.dart';

class NguoncMoviesByCategoryItemModel extends NguoncMoviesByCategoryItemEntity {
  NguoncMoviesByCategoryItemModel({
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

  factory NguoncMoviesByCategoryItemModel.fromJson(Map<String, dynamic> json) {
    return NguoncMoviesByCategoryItemModel(
      id: json["id"] ?? AppConstants.noData,
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
}
