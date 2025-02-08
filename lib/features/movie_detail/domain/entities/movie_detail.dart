import 'package:smoth_movie_app/features/movie_detail/domain/entities/episodes.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_info.dart';

class MovieDetailEntity {
  bool status;
  String msg;
  MovieInfoEntity movieInfo;
  List<EpisodesEntity> episodes;

  MovieDetailEntity({
    required this.status,
    required this.msg,
    required this.movieInfo,
    required this.episodes,
  });
}
