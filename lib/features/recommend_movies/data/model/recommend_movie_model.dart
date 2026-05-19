import '../../domain/entities/recommend_movie.dart';

class RecommendMovieModel extends RecommendMovieEntity {
  const RecommendMovieModel({
    required super.rank,
    required super.title,
    required super.description,
    required super.image,
    required super.bigImage,
    required super.genre,
    required super.thumbnail,
    required super.rating,
    required super.id,
    required super.year,
    required super.imdbid,
    required super.imdbLink,
  });

  factory RecommendMovieModel.fromJson(Map<String, dynamic> json) {
    return RecommendMovieModel(
      rank: json['rank']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      bigImage: json['big_image']?.toString() ?? '',
      genre: (json['genre'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      thumbnail: json['thumbnail']?.toString() ?? '',
      rating: json['rating']?.toString() ?? '',
      id: json['id']?.toString() ?? '',
      year: json['year']?.toString() ?? '',
      imdbid: json['imdbid']?.toString() ?? '',
      imdbLink: json['imdb_link']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'title': title,
      'description': description,
      'image': image,
      'big_image': bigImage,
      'genre': genre,
      'thumbnail': thumbnail,
      'rating': rating,
      'id': id,
      'year': year,
      'imdbid': imdbid,
      'imdb_link': imdbLink,
    };
  }
}
