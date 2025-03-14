import 'dart:convert';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:http/http.dart' as http;

abstract interface class MoviesRemoteDataSource {
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  });
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final http.Client client;
  const MoviesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  }) async {
    try {
      List<MovieItemModel> data = [];
      var url =
          "${AppSecret.kkPhimUrl}${ApiEndPoint.categoryEndPoint}$cateName?page=$page&limit=$limit";
      var uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body)["data"]["items"] as List;
        for (var e in jsonRes) {
          data.add(MovieItemModel.fromJson(e));
        }
        return data;
      } else {
        throw ServerException("Lỗi khi lấy dữ liệu phim $cateName");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
