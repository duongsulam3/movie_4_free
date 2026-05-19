import '../../../../../api/search/search_get.dart';
import '../../../../../common/error/exception.dart';
import '../../../../../common/utils/helper/helper.dart';
import '../../../../../common/utils/network/app_service.dart';
import '../../../../movies/data/model/single_movies/movie_item_model.dart';
import '../../models/search_suggestion_model.dart';

abstract class SearchMovieRemoteDataSource {
  Future<List<MovieItemModel>> getSearchMovies({
    required String query,
    required int page,
    required int limit,
  });

  Future<List<SearchSuggestionModel>> getSearchSuggestions({
    required String query,
    required int limit,
  });
}

class SearchMovieRemoteDatasourceImpl implements SearchMovieRemoteDataSource {
  final AppService client;
  const SearchMovieRemoteDatasourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getSearchMovies({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      List<MovieItemModel> movies = [];

      final res = await SearchGETAPI.apiSearchGETMovies(
        client: client,
        query: query,
        page: page,
        limit: limit,
      );

      /// Decode JSON response
      final jsonRes = client.decodeJsonResponse(res.data);

      /// Check if data is null return without parsing
      if (jsonRes["data"]["items"] == null) return movies;

      /// Parse JSON to List<MovieItemModel>
      final parsed = await client.parseJson(() {
        final items = jsonRes["data"]["items"] as List<dynamic>;
        return List.generate(
          items.length,
          (e) => MovieItemModel.fromJson(items[e]),
        );
      });

      /// Set parsed movies to variable
      movies = parsed;
      return movies;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<SearchSuggestionModel>> getSearchSuggestions({
    required String query,
    required int limit,
  }) async {
    try {
      List<SearchSuggestionModel> suggestions = [];

      final res = await SearchGETAPI.apiSearchGETMovies(
        client: client,
        query: query,
        page: 1,
        limit: limit,
      );

      /// Decode JSON response
      final jsonRes = client.decodeJsonResponse(res.data);

      /// Check if data is null return without parsing
      if (jsonRes["data"]["items"] == null) return suggestions;

      /// Parse JSON to List<SearchSuggestionModel>
      final parsed = await client.parseJson<List<SearchSuggestionModel>>(() {
        final items = jsonRes["data"]["items"] as List<dynamic>;
        return List.generate(
          items.length,
          (e) => SearchSuggestionModel.fromJson(items[e]),
        );
      });

      // Keep only first occurrence by case-insensitive name.
      final listed = Helper.deduplicateSearchSuggestions(parsed);

      /// Set parsed movies to variable
      suggestions = listed;
      return suggestions;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
