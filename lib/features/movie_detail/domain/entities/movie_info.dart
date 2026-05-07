import 'package:smoth_movie_app/features/movie_detail/domain/entities/created.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/imdb.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/modify.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/tmdb.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class MovieInfoEntity extends MovieItemEntity {
  final TmdbEntity tmdb;
  final ImdbEntity imdb;
  final CreatedEntity created;
  final ModifiedEnity modified;
  final String content;
  final String status;
  final bool isCopyright;
  final bool subDocquyen;
  final bool chieurap;
  final String trailerUrl;
  final String episodeTotal;
  final String notify;
  final String showtimes;
  final int view;
  final List<String> actor;
  final List<String> director;

  const MovieInfoEntity({
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
