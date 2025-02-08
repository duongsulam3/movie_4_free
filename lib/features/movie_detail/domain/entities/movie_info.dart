import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/country.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/created.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/imdb.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/modify.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/tmdb.dart';

class MovieInfoEntity extends RecentlyUpdateListItemEntity {
  TmdbEntity tmdb;
  ImdbEntity imdb;
  CreatedEntity created;
  ModifiedEnity modified;
  String content;
  String type;
  String status;
  bool isCopyright;
  bool subDocquyen;
  bool chieurap;
  String trailerUrl;
  String time;
  String episodeCurrent;
  String episodeTotal;
  String quality;
  String lang;
  String notify;
  String showtimes;
  int view;
  List<String> actor;
  List<String> director;
  List<CategoryEntity> category;
  List<CountryEnity> country;

  MovieInfoEntity({
    required super.sId,
    required super.name,
    required super.slug,
    required super.originName,
    required super.posterUrl,
    required super.thumbUrl,
    required super.year,
    required this.tmdb,
    required this.imdb,
    required this.created,
    required this.modified,
    required this.content,
    required this.type,
    required this.status,
    required this.isCopyright,
    required this.subDocquyen,
    required this.chieurap,
    required this.trailerUrl,
    required this.time,
    required this.episodeCurrent,
    required this.episodeTotal,
    required this.quality,
    required this.lang,
    required this.notify,
    required this.showtimes,
    required this.view,
    required this.actor,
    required this.director,
    required this.category,
    required this.country,
  });
}
