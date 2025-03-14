import 'package:smoth_movie_app/features/movie_detail/domain/entities/created.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/imdb.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/modify.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/tmdb.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class MovieInfoEntity extends MovieItemEntity {
  TmdbEntity tmdb;
  ImdbEntity imdb;
  CreatedEntity created;
  ModifiedEnity modified;
  String content;
  String status;
  bool isCopyright;
  bool subDocquyen;
  bool chieurap;
  String trailerUrl;
  String episodeTotal;
  String notify;
  String showtimes;
  int view;
  List<String> actor;
  List<String> director;

  MovieInfoEntity({
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
    required this.tmdb,
    required this.imdb,
    required this.actor,
    required this.chieurap,
    required this.content,
    required this.created,
    required this.director,
    required this.episodeTotal,
    required this.isCopyright,
    required this.modified,
    required this.notify,
    required this.showtimes,
    required this.status,
    required this.subDocquyen,
    required this.trailerUrl,
    required this.view,
  });
}
