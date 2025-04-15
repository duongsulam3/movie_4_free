import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_episodes_item_entity.dart';

class NguoncEpisodesEntity {
  String serverName;
  List<ItemsEntity> items;

  NguoncEpisodesEntity({required this.serverName, required this.items});
}
