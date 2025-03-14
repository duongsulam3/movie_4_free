import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class SearchMovieEntity extends MovieItemEntity {
  SearchMovieEntity({
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
}
