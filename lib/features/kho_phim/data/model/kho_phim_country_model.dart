import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_country_entity.dart';

class KhoPhimCountryModel extends KhoPhimCountryEntity {
  KhoPhimCountryModel({
    required super.id,
    required super.name,
    required super.slug,
  });

  factory KhoPhimCountryModel.fromJson(Map<String, dynamic> json) {
    return KhoPhimCountryModel(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
    );
  }
}
