import 'package:smoth_movie_app/features/home/home_search/domain/entities/search_movie_entity.dart';

class SearchMovieModel extends SearchMovieEntity {
  SearchMovieModel({
    required super.sId,
    required super.name,
    required super.slug,
    required super.originName,
    required super.posterUrl,
    required super.thumbUrl,
    required super.year,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      originName: json['origin_name'],
      posterUrl: json['poster_url'],
      thumbUrl: json['thumb_url'],
      year: json['year'],
    );
  }
}
