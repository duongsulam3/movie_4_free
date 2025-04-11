import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/country.dart';

class MovieItemEntity {
  final String sId;
  final String name;
  final String slug;
  final String originName;
  final String posterUrl;
  final String thumbUrl;
  final String quality;
  final String lang;
  final String episodeCurrent;
  final String? time;
  final int? year;
  final String? type;
  final List<CategoryEntity>? categories;
  final List<CountryEnity>? countries;
  const MovieItemEntity({
    required this.sId,
    required this.name,
    required this.slug,
    required this.originName,
    required this.posterUrl,
    required this.thumbUrl,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    this.time,
    this.year,
    this.type,
    this.categories,
    this.countries,
  });
}
