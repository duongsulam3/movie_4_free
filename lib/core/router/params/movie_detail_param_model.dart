import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class MovieDetailParamModel {
  final MovieItemEntity movie;
  final bool hasHeroEffect;
  final String? tag;
  const MovieDetailParamModel({
    required this.movie,
    this.hasHeroEffect = false,
    this.tag,
  });
}
