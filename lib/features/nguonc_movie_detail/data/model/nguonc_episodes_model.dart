import 'package:smoth_movie_app/features/nguonc_movie_detail/data/model/nguonc_episodes_item_model.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_episodes_entity.dart';

class NguoncEpisodesModel extends NguoncEpisodesEntity {
  NguoncEpisodesModel({
    required super.serverName,
    required super.items,
  });

  factory NguoncEpisodesModel.fromJson(Map<String, dynamic> json) {
    return NguoncEpisodesModel(
      serverName: json['server_name'],
      items: (json["items"] as List)
          .map((e) => NguoncEpisodesItemModel.fromJson(e))
          .toList(),
    );
  }
}
