import 'package:smoth_movie_app/features/movie_detail/domain/entities/modify.dart';

class ModifiedModel extends ModifiedEnity {
  ModifiedModel({required super.time});

  factory ModifiedModel.fromJson(Map<String, dynamic> json) {
    return ModifiedModel(
      time: json["time"],
    );
  }

  static List<ModifiedModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ModifiedModel.fromJson).toList();
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["time"] = time;
//     return data;
//   }
}
