import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncMovieDetailParamsModel {
  final NguoncMovieItemEntity movie;
  final String? tag;
  final bool hasHeroEffect;
  const NguoncMovieDetailParamsModel({
    required this.movie,
    this.tag,
    this.hasHeroEffect = false,
  });
}
