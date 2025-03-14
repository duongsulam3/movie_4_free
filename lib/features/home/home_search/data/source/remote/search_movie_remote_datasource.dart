import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';

abstract class SearchMovieRemoteDataSource {
  Future<List<MovieItemModel>> getSearchMovies({
    required String query,
    required int page,
    required int limit,
  });
}

class SearchMovieRemoteDatasourceImpl implements SearchMovieRemoteDataSource {
  final http.Client client;
  const SearchMovieRemoteDatasourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getSearchMovies({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      List<MovieItemModel> data = [];
      var url =
          "${AppSecret.kkPhimUrl + ApiEndPoint.searchMoviesEndpoint}keyword=$query&page=$page&sort_lang=vietsub&limit=$limit";
      var uri = Uri.parse(url);
      log(url);
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
