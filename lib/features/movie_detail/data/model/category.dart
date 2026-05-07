import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
    );
  }

  static List<CategoryModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "slug": slug,
    };
  }
}
