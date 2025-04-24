import 'package:smoth_movie_app/features/nguonc_categories/domain/entity/nguonc_category_item_entity.dart';

class NguoncCategoryItemModel extends NguoncCategoryItemEntity {
  NguoncCategoryItemModel({
    required super.name,
    required super.title,
    required super.slug,
  });

  factory NguoncCategoryItemModel.fromJson(Map<String, dynamic> json) {
    return NguoncCategoryItemModel(
      name: json['name'],
      title: json['title'],
      slug: json['slug'],
    );
  }
}
