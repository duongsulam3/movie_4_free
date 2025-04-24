import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncMovieDetailParamsModel {
  final NguoncMovieItemEntity movie;
  final String tag;
  const NguoncMovieDetailParamsModel({required this.movie, required this.tag});
}
