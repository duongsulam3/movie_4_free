import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_category_entity.dart';

class KhoPhimCategoryModel extends KhoPhimCategoryEntity {
  KhoPhimCategoryModel({
    required super.id,
    required super.name,
    required super.slug,
  });

  factory KhoPhimCategoryModel.fromJson(Map<String, dynamic> json) {
    return KhoPhimCategoryModel(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
    );
  }
}
