import 'package:equatable/equatable.dart';

class RecommendMovieEntity extends Equatable {
  final String rank;
  final String title;
  final String description;
  final String image;
  final String bigImage;
  final List<String> genre;
  final String thumbnail;
  final String rating;
  final String id;
  final String year;
  final String imdbid;
  final String imdbLink;

  const RecommendMovieEntity({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbid,
    required this.imdbLink,
  });

  @override
  List<Object?> get props => [
        rank,
        title,
        description,
        image,
        bigImage,
        genre,
        thumbnail,
        rating,
        id,
        year,
        imdbid,
        imdbLink,
      ];
}
