import 'package:smoth_movie_app/features/movie_detail/domain/entities/imdb.dart';

class ImdbModel extends ImdbEntity {
  ImdbModel({
    super.id,
  });

  factory ImdbModel.fromJson(Map<String, dynamic> json) {
    return ImdbModel(
      id: json["id"],
    );
  }
  static List<ImdbModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ImdbModel.fromJson).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["id"] = id;
  //   return data;
  // }
}
