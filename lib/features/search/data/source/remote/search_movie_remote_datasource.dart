import 'dart:developer';

import 'package:smoth_movie_app/api/search/search_get.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
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

      if (res.data?["status"] == "success") {
        movies = Helper.parseMovies(res.toString());
      }

      return movies;
    } catch (e) {
      log("Unexpected error on server status 200 ~ 299: $e");
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

      if (res.data?["status"] == "success") {
        suggestions = Helper.parseSearchSuggestions(res.toString());
      }

      return suggestions;
    } catch (e) {
      log("Unexpected error on suggestion status 200 ~ 299: $e");
      throw ServerException(e.toString());
    }
  }
}
