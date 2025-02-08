import 'package:smoth_movie_app/features/movie_detail/domain/entities/server_data.dart';

class EpisodesEntity {
  String serverName;
  List<ServerDataEntity> serverData;

  EpisodesEntity({
    required this.serverName,
    required this.serverData,
  });
}
