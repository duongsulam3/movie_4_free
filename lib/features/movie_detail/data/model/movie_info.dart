import 'package:smoth_movie_app/features/movie_detail/data/model/category.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/country.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/created.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/imdb.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/modified.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/tmdb.dart';
//Entity
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_info.dart';

class MovieInfoModel extends MovieInfoEntity {
  MovieInfoModel({
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
    required super.tmdb,
    required super.imdb,
    required super.actor,
    required super.chieurap,
    required super.content,
    required super.created,
    required super.director,
    required super.episodeTotal,
    required super.isCopyright,
    required super.modified,
    required super.notify,
    required super.showtimes,
    required super.status,
    required super.subDocquyen,
    required super.trailerUrl,
    required super.view,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) {
    return MovieInfoModel(
      tmdb: TmdbModel.fromJson(json["tmdb"]),
      imdb: ImdbModel.fromJson(json["imdb"]),
      created: CreatedModel.fromJson(json["created"]),
      modified: ModifiedModel.fromJson(json["modified"]),
      sId: json["_id"],
      name: json["name"],
      slug: json["slug"],
      originName: json["origin_name"],
      content: json["content"],
      type: json["type"],
      status: json["status"],
      posterUrl: json["poster_url"],
      thumbUrl: json["thumb_url"],
      isCopyright: json["is_copyright"],
      subDocquyen: json["sub_docquyen"],
      chieurap: json["chieurap"],
      trailerUrl: json["trailer_url"],
      time: json["time"],
      episodeCurrent: json["episode_current"],
      episodeTotal: json["episode_total"],
      quality: json["quality"],
      lang: json["lang"],
      notify: json["notify"],
      showtimes: json["showtimes"],
      year: json["year"],
      view: json["view"],
      actor: List<String>.from(json["actor"].map((e) => e)),
      director: List<String>.from(json["director"].map((e) => e)),
      categories: List<CategoryModel>.from(
        json["category"].map(
          (e) => CategoryModel.fromJson(e),
        ),
      ),
      countries: List<CountryModel>.from(
        json["country"].map(
          (e) => CountryModel.fromJson(e),
        ),
      ),
    );
  }

  static List<MovieInfoModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MovieInfoModel.fromJson).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   // data["tmdb"] = tmdb.toJson();
  //   // data["imdb"] = imdb.toJson();
  //   // data["created"] = created.toJson();
  //   // data["modified"] = modified.toJson();
  //   data["_id"] = sId;
  //   data["name"] = name;
  //   data["slug"] = slug;
  //   data["origin_name"] = originName;
  //   data["content"] = content;
  //   data["type"] = type;
  //   data["status"] = status;
  //   data["poster_url"] = posterUrl;
  //   data["thumb_url"] = thumbUrl;
  //   data["is_copyright"] = isCopyright;
  //   data["sub_docquyen"] = subDocquyen;
  //   data["chieurap"] = chieurap;
  //   data["trailer_url"] = trailerUrl;
  //   data["time"] = time;
  //   data["episode_current"] = episodeCurrent;
  //   data["episode_total"] = episodeTotal;
  //   data["quality"] = quality;
  //   data["lang"] = lang;
  //   data["notify"] = notify;
  //   data["showtimes"] = showtimes;
  //   data["year"] = year;
  //   data["view"] = view;
  //   data["actor"] = actor;
  //   data["director"] = director;
  //   // data["category"] = category.map((e) => e.toJson()).toList();
  //   // data["country"] = country.map((e) => e.toJson()).toList();
  //   return data;
  // }
}
