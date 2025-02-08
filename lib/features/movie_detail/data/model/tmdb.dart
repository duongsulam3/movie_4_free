import 'package:smoth_movie_app/features/movie_detail/domain/entities/tmdb.dart';

class TmdbModel extends TmdbEntity {
  TmdbModel({
    super.id,
    super.type,
    super.season,
    required super.voteCount,
  });

  factory TmdbModel.fromJson(Map<String, dynamic> json) {
    return TmdbModel(
      id: json["id"],
      type: json["type"],
      season: json["season"],
      voteCount: json["vote_count"],
      // voteAverage: json["vote_average"],
    );
  }

  static List<TmdbModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(TmdbModel.fromJson).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["type"] = type;
  //   data["id"] = id;
  //   data["season"] = season;
  //   // data["vote_average"] = voteAverage;
  //   data["vote_count"] = voteCount;
  //   return data;
  // }

}
