import 'dart:convert';

import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';
import 'package:http/http.dart' as http;

abstract interface class AnimeMoviesRemoteDataSource {
  Future<List<MovieItemModel>> getAnimeMovies();
}

class AnimeMoviesRemoteDataSourceImpl implements AnimeMoviesRemoteDataSource {
  final http.Client client;
  const AnimeMoviesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getAnimeMovies() async {
    try {
      List<MovieItemModel> data = [];
      var url = AppSecret.baseUrl +
          AppSecret.apiv1Url +
          ApiEndPoint.animeMoviesEndpoint;
      var uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body)["data"]["items"];
        // var data = SingleMoviePageModel.fromJson(jsonResponse);
        for (var item in jsonResponse) {
          data.add(MovieItemModel.fromJson(item));
        }
        return data;
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu phim hoạt hình");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
