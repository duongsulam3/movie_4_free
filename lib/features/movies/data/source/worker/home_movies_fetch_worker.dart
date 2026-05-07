import 'dart:isolate';

import 'package:smoth_movie_app/api/movies/movies_get.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

class HomeMoviesFetchWorker {
  const HomeMoviesFetchWorker._();

  static Future<List<MovieItemModel>> fetchMovies({
    required String baseUrl,
    required int page,
    required int limit,
    required String cateName,
  }) async {
    final List<dynamic> raw = await Isolate.run(() async {
      final client = AppService(baseUrl: baseUrl);
      final res = await MoviesGETAPI.apiMoviesGETMovies(
        client: client,
        page: page,
        limit: limit,
        cateName: cateName,
      );
      final jsonRes = client.decodeJsonResponse(res.data);
      final items = (jsonRes['data']['items'] as List<dynamic>)
          .map((e) => MovieItemModel.fromJson(e).toJson())
          .toList();

      return items;
    });

    return raw.map((e) => MovieItemModel.fromJson(e)).toList();
  }

  static Future<List<RecentlyUpdateListItemModel>> fetchRecentlyUpdated({
    required String baseUrl,
  }) async {
    final List<dynamic> raw = await Isolate.run(() async {
      final client = AppService(baseUrl: baseUrl);
      final res = await MoviesGETAPI.apiMoviesGETRecentlyUpdate(client: client);
      final jsonRes = client.decodeJsonResponse(res.data);
      final items = (jsonRes['items'] as List)
          .map((e) => RecentlyUpdateListItemModel.fromJson(e).toJson())
          .toList();

      return items;
    });

    return raw.map((e) => RecentlyUpdateListItemModel.fromJson((e))).toList();
  }
}
