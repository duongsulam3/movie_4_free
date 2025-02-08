import 'dart:convert';
import 'dart:developer';

import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';
import 'package:http/http.dart' as http;

abstract interface class SeriesMovieRemoteDataSource {
  Future<List<MovieItemModel>> getSeriesMovies();
}

class SeriesMovieRemoteDataSourceImpl implements SeriesMovieRemoteDataSource {
  final http.Client client;
  const SeriesMovieRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getSeriesMovies() async {
    List<MovieItemModel> data = [];
    try {
      var url = AppSecret.baseUrl +
          AppSecret.apiv1Url +
          ApiEndPoint.seriesMovieEndpoint;
      var uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body)["data"]["items"];
        for (var item in jsonResponse) {
          data.add(MovieItemModel.fromJson(item));
        }
        return data;
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu phim lẻ");
      }
    } catch (e, strackTrace) {
      log("${e.toString()}: ${strackTrace.toString()}");
      throw ServerException(e.toString());
    }
  }
}
