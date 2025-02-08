import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/country.dart';

class MovieItemEntity extends RecentlyUpdateListItemEntity {
  final String type;
  final String time;
  final String episodeCurrent;
  final String quality;
  final String lang;
  final List<CategoryEntity> categories;
  final List<CountryEnity> countries;
  MovieItemEntity({
    required super.sId,
    required super.name,
    required super.slug,
    required super.originName,
    required super.posterUrl,
    required super.thumbUrl,
    required super.year,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.type,
    required this.categories,
    required this.countries,
  });
}
