import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/model/nguonc_category_model.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/model/nguonc_episodes_model.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';

class NguoncMovieModel extends NguoncMovieEntity {
  NguoncMovieModel({
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
    required super.episodes,
    required super.categories,
    required super.casts,
    required super.time,
    required super.director,
  });

  factory NguoncMovieModel.fromJson(Map<String, dynamic> json) {
    List<NguoncCategoryModel> categories = [];
    for (int i = 1; i <= json['category'].length; i++) {
      categories.add(NguoncCategoryModel.fromJson(
        json['category'][i.toString()],
      ));
    }
    return NguoncMovieModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      originalName: json['original_name'] ?? AppConstants.noData,
      thumbUrl: json['thumb_url'],
      posterUrl: json['poster_url'],
      created: json['created'],
      modified: json['modified'],
      description: json['description'],
      totalEpisodes: json['total_episodes'],
      currentEpisode: json['current_episode'],
      quality: json['quality'],
      language: json['language'],
      categories: categories,
      episodes: (json['episodes'] as List)
          .map((e) => NguoncEpisodesModel.fromJson(e))
          .toList(),
      time: json['time'] ?? AppConstants.noData,
      casts: json['casts'] ?? AppConstants.noData,
      director: json['director'] ?? AppConstants.noData,
    );
  }
}
