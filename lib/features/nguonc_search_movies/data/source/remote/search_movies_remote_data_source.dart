import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/api/nguonc/nguonc_search_get.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/model/nguonc_movie_item_model.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/model/nguonc_search_suggestion_model.dart';

abstract interface class NguonCSearchMoviesRemoteDataSource {
  Future<List<NguoncMovieItemModel>> searchFilms({
    required String query,
    required int page,
  });

  Future<List<NguoncSearchSuggestionModel>> getSearchSuggestions({
    required String query,
    required int limit,
  });
}

class NguonCSearchMoviesRemoteDataSourceImpl
    implements NguonCSearchMoviesRemoteDataSource {
  final AppService client;
  const NguonCSearchMoviesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<NguoncMovieItemModel>> searchFilms({
    required String query,
    required int page,
  }) async {
    try {
      final res = await NguonCSearchGETAPI.apiNguonCSearchGETFilms(
        client: client,
        query: query,
        page: page,
      );
      final jsonRes = client.decodeJsonResponse(res.data);
      return client.parseJson<List<NguoncMovieItemModel>>(() {
        final items = jsonRes["items"] as List<dynamic>;
        return items.map((e) => NguoncMovieItemModel.fromJson(e)).toList();
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<NguoncSearchSuggestionModel>> getSearchSuggestions({
    required String query,
    required int limit,
  }) async {
    try {
      final res = await NguonCSearchGETAPI.apiNguonCSearchGETFilms(
        client: client,
        query: query,
        page: 1,
      );
      final jsonRes = client.decodeJsonResponse(res.data);
      return client.parseJson<List<NguoncSearchSuggestionModel>>(() {
        final items = (jsonRes["items"] as List<dynamic>).take(limit);
        final suggestions = items
            .map((e) => NguoncSearchSuggestionModel.fromJson(e))
            .where((e) => e.name.trim().isNotEmpty)
            .toList();
        return _deduplicateSuggestions(suggestions);
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  List<NguoncSearchSuggestionModel> _deduplicateSuggestions(
    List<NguoncSearchSuggestionModel> suggestions,
  ) {
    final deduplicated = <NguoncSearchSuggestionModel>[];
    for (final suggestion in suggestions) {
      final existed = deduplicated.any(
        (item) => item.name.toLowerCase() == suggestion.name.toLowerCase(),
      );
      if (!existed) deduplicated.add(suggestion);
    }
    return deduplicated;
  }
}
