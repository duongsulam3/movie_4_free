import 'package:smoth_movie_app/features/movie_detail/data/model/server_data.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/episodes.dart';

class EpisodesModel extends EpisodesEntity {
  EpisodesModel({
    required super.serverName,
    required super.serverData,
  });

  factory EpisodesModel.fromJson(Map<String, dynamic> json) {
    return EpisodesModel(
      serverName: json["server_name"],
      serverData: (json["server_data"] as List)
          .map((e) => ServerDataModel.fromJson(e))
          .toList(),
    );
  }

  static List<EpisodesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(EpisodesModel.fromJson).toList();
  }
}
