import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_page.dart';

class SingleMoviePageModel extends SingleMoviePageEntity {
  SingleMoviePageModel({
    required super.titlePage,
    required super.items,
  });

  factory SingleMoviePageModel.fromJson(Map<String, dynamic> json) {
    return SingleMoviePageModel(
      titlePage: json["titlePage"],
      items: List.from(
        json["items"].map((e) => MovieItemModel.fromJson(e)),
      ),
    );
  }
}
