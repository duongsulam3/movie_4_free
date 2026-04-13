import 'dart:developer';

import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/core/utils/secret/api_end_point.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

abstract class SearchMovieRemoteDataSource {
  Future<List<MovieItemModel>> getSearchMovies({
    required String query,
    required int page,
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
      final endpoint =
          "${AppSecret.apiv1Url + ApiEndPoint.searchMoviesEndpoint}keyword=$query&page=$page&sort_lang=vietsub&limit=$limit";

      final res = await client.getRequest(endpoint);

      if (res.data?["status"] == "success") {
        movies = Helper.parseMovies(res.toString());
      }

      return movies;
    } catch (e) {
      log("Unexpected error on server status 200 ~ 299: $e");
      throw ServerException(e.toString());
    }
  }
}
