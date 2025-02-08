import 'package:smoth_movie_app/features/movie_detail/domain/entities/server_data.dart';

class ServerDataModel extends ServerDataEntity {
  ServerDataModel({
    required super.name,
    required super.slug,
    required super.filename,
    required super.linkEmbed,
    required super.linkM3U8,
  });

  factory ServerDataModel.fromJson(Map<String, dynamic> json) {
    return ServerDataModel(
      name: json["name"],
      slug: json["slug"],
      filename: json["filename"],
      linkEmbed: json["link_embed"],
      linkM3U8: json["link_m3u8"],
    );
  }

  static List<ServerDataModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ServerDataModel.fromJson).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["name"] = name;
  //   data["slug"] = slug;
  //   data["filename"] = filename;
  //   data["link_embed"] = linkEmbed;
  //   data["link_m3u8"] = linkM3U8;
  //   return data;
  // }
}
