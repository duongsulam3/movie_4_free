import 'package:smoth_movie_app/features/nguonc_movie_detail/data/model/nguonc_type_list_model.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_category_entity.dart';

class NguoncCategoryModel extends NguoncCategoryEntity {
  NguoncCategoryModel({
    required super.group,
    required super.list,
  });

  factory NguoncCategoryModel.fromJson(Map<String, dynamic> json) {
    return NguoncCategoryModel(
      group: NguoncTypeListModel.fromJson(json['group']),
      list: json['list'] == null
          ? []
          : (json['list'] as List)
              .map((e) => NguoncTypeItemModel.fromJson(e))
              .toList(),
    );
  }
}

class NguoncTypeItemModel extends NguoncTypeItem {
  NguoncTypeItemModel({required super.id, required super.name});

  factory NguoncTypeItemModel.fromJson(Map<String, dynamic> json) {
    return NguoncTypeItemModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
