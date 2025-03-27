import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/movie_detail.dart';

abstract interface class DetailMovieRemoteDataSource {
  Future<MovieDetailModel> getDetailMovie({required String slug});
}

class DetailMovieRemoteDataSourceImpl implements DetailMovieRemoteDataSource {
  final http.Client client;
  const DetailMovieRemoteDataSourceImpl({required this.client});
  @override
  Future<MovieDetailModel> getDetailMovie({required String slug}) async {
    try {
      var url = AppSecret.baseUrl + ApiEndPoint.detailMovieEndpoint + slug;
      var uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body);
        return MovieDetailModel.fromJson(jsonResponse);
      } else {
        throw ServerException("Lỗi khi lấy dữ liệu: chi tiết phim: $slug");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
