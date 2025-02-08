import 'package:smoth_movie_app/features/movie_detail/domain/entities/country.dart';

class CountryModel extends CountryEnity {
  CountryModel({
    required super.id,
    required super.name,
    required super.slug,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
    );
  }

  static List<CountryModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CountryModel.fromJson).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["id"] = id;
  //   data["name"] = name;
  //   data["slug"] = slug;
  //   return data;
  // }
}
