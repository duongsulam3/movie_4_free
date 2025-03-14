import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/country.dart';

class MovieItemEntity {
  final String sId;
  final String name;
  final String slug;
  final String originName;
  final String posterUrl;
  final String thumbUrl;
  final int year;
  final String type;
  final String time;
  final String episodeCurrent;
  final String quality;
  final String lang;
  final List<CategoryEntity> categories;
  final List<CountryEnity> countries;
  const MovieItemEntity({
    required this.sId,
    required this.name,
    required this.slug,
    required this.originName,
    required this.posterUrl,
    required this.thumbUrl,
    required this.year,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.type,
    required this.categories,
    required this.countries,
  });
}
