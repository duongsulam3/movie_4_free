import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_episodes_item_entity.dart';

class NguoncEpisodesItemModel extends ItemsEntity {
  NguoncEpisodesItemModel({
    required super.name,
    required super.slug,
    required super.embed,
    required super.m3U8,
  });

  factory NguoncEpisodesItemModel.fromJson(Map<String, dynamic> json) {
    return NguoncEpisodesItemModel(
      name: json['name'],
      slug: json['slug'],
      embed: json['embed'],
      m3U8: json['m3u8'],
    );
  }
}
