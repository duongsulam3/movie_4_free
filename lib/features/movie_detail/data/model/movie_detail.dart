import 'package:smoth_movie_app/features/movie_detail/data/model/episodes.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/movie_info.dart';
//Entity
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required super.status,
    required super.msg,
    required super.movieInfo,
    required super.episodes,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      status: json["status"],
      msg: json["msg"],
      movieInfo: MovieInfoModel.fromJson(json["movie"]),
      episodes:
          (json["episodes"] as List).map((e) => EpisodesModel.fromJson(e)).toList(),
    );
  }

  static List<MovieDetailModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MovieDetailModel.fromJson).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["status"] = status;
  //   data["msg"] = msg;
  //   // data["movie"] = MovieInfoModel.toJson();
  //   // data["episodes"] = episodes.map((e) => e.toJson()).toList();
  //   return data;
  // }
}
