import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class SingleMoviePageEntity {
  final String titlePage;
  final List<MovieItemEntity> items;

  SingleMoviePageEntity({
    required this.titlePage,
    required this.items,
  });
}
