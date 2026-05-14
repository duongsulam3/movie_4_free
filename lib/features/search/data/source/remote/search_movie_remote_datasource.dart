import 'package:smoth_movie_app/api/search/search_get.dart';
import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/helper/helper.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:smoth_movie_app/features/search/data/models/search_suggestion_model.dart';

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
      final jsonRes = client.decodeJsonResponse(res.data);

      if (jsonRes["status"] == "success") {
        movies = await client.parseJson<List<MovieItemModel>>(() {
          final items = jsonRes["data"]["items"] as List<dynamic>;
          return items.map((e) => MovieItemModel.fromJson(e)).toList();
        });
      }

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
      final jsonRes = client.decodeJsonResponse(res.data);

      if (jsonRes["status"] == "success") {
        suggestions = await client.parseJson<List<SearchSuggestionModel>>(() {
          final items = jsonRes["data"]["items"] as List<dynamic>;
          final parsedSuggestions = items
              .map((e) => SearchSuggestionModel.fromJson(e))
              .where((e) => e.name.trim().isNotEmpty)
              .toList();

          // Keep only first occurrence by case-insensitive name.
          final listed = Helper.deduplicateSearchSuggestions(parsedSuggestions);
          return listed;
        });
      }

      return suggestions;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
