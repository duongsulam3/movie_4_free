import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_category_entity.dart';

class NguoncTypeListModel extends NguoncTypeEntity {
  NguoncTypeListModel({required super.id, required super.name});

  factory NguoncTypeListModel.fromJson(Map<String, dynamic> json) {
    return NguoncTypeListModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
