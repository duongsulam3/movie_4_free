import 'package:smoth_movie_app/features/movie_detail/data/model/category.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/country.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class MovieItemModel extends MovieItemEntity {
  const MovieItemModel({
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

  factory MovieItemModel.fromJson(Map<String, dynamic> json) {
    return MovieItemModel(
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

  Map<String, dynamic> toJson() {
    return {
      "_id": sId,
      "name": name,
      "slug": slug,
      "origin_name": originName,
      "poster_url": posterUrl,
      "thumb_url": thumbUrl,
      "year": year,
      "time": time,
      "episode_current": episodeCurrent,
      "quality": quality,
      "lang": lang,
      "type": type,
      "category": categories
          .map((e) =>
              CategoryModel(id: e.id, name: e.name, slug: e.slug).toJson())
          .toList(),
      "country": countries
          .map((e) =>
              CountryModel(id: e.id, name: e.name, slug: e.slug).toJson())
          .toList(),
    };
  }
}
