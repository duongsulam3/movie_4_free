import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_search_suggestion_entity.dart';

class NguoncSearchSuggestionModel extends NguoncSearchSuggestionEntity {
  const NguoncSearchSuggestionModel({required super.name});

  factory NguoncSearchSuggestionModel.fromJson(Map<String, dynamic> json) {
    return NguoncSearchSuggestionModel(name: json["name"] ?? "");
  }
}
