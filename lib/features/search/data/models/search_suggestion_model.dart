import 'package:smoth_movie_app/features/search/domain/entities/search_suggestion_entity.dart';

class SearchSuggestionModel extends SearchSuggestionEntity {
  const SearchSuggestionModel({required super.name});

  factory SearchSuggestionModel.fromJson(Map<String, dynamic> json) {
    return SearchSuggestionModel(name: json["name"] ?? "");
  }
}
