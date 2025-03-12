import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';

abstract class SearchMovieRemoteDataSource {
  Future<List<MovieItemModel>> getSearchMovies(String query);
}

class SearchMovieRemoteDatasourceImpl implements SearchMovieRemoteDataSource {
  final http.Client client;
  const SearchMovieRemoteDatasourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getSearchMovies(String query) async {
    List<MovieItemModel> data = [];
    try {
      var url = AppSecret.baseUrl +
          AppSecret.apiv1Url +
          ApiEndPoint.searchMoviesEndpoint +
          query +
          ApiEndPoint.limitSearchBy12;
      var uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body)["data"]["items"];
        for (var item in jsonResponse) {
          data.add(MovieItemModel.fromJson(item));
        }
        return data;
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu tìm kiếm phim");
      }
    } catch (e, strackTrace) {
      log("${e.toString()}: ${strackTrace.toString()}");
      throw ServerException(e.toString());
    }
  }
}
