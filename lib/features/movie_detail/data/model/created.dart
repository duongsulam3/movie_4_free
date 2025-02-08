import 'package:smoth_movie_app/features/movie_detail/domain/entities/created.dart';

class CreatedModel extends CreatedEntity {
  CreatedModel({required super.time});

  factory CreatedModel.fromJson(Map<String, dynamic> json) {
    return CreatedModel(
      time: json["time"],
    );
  }

  static List<CreatedModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CreatedModel.fromJson).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["time"] = time;
  //   return data;
  // }
}
