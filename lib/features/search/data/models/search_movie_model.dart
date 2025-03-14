import 'package:smoth_movie_app/features/search/domain/entities/search_movie_entity.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/category.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/country.dart';

class SearchMovieModel extends SearchMovieEntity {
  SearchMovieModel({
    required super.sId,
    required super.name,
    required super.slug,
    required super.originName,
    required super.posterUrl,
    required super.thumbUrl,
    required super.year,
    required super.time,
    required super.episodeCurrent,
    required super.quality,
    required super.lang,
    required super.type,
    required super.categories,
    required super.countries,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
      sId: json["_id"],
      name: json["name"],
      slug: json["slug"],
      originName: json["origin_name"],
      posterUrl: json["poster_url"],
      thumbUrl: json["thumb_url"],
      year: json["year"],
      time: json["time"],
      episodeCurrent: json["episode_current"],
      quality: json["quality"],
      lang: json["lang"],
      type: json["type"],
      categories: List<CategoryModel>.from(
        json["category"].map((e) => CategoryModel.fromJson(e)),
      ),
      countries: List<CountryModel>.from(
        json["country"].map((e) => CountryModel.fromJson(e)),
      ),
    );
  }
}
