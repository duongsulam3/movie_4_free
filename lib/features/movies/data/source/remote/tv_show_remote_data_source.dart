import 'dart:convert';
import 'dart:developer';

import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';
import 'package:http/http.dart' as http;

abstract interface class TvShowRemoteDataSource {
  Future<List<MovieItemModel>> getTvShows();
}

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  final http.Client client;
  const TvShowRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getTvShows() async {
    try {
      List<MovieItemModel> data = [];
      var uri = Uri.parse(
        AppSecret.baseUrl + AppSecret.apiv1Url + ApiEndPoint.tvShowEndpoint,
      );
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body)["data"]["items"];
        for (var item in jsonResponse) {
          data.add(MovieItemModel.fromJson(item));
        }
        return data;
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu tv shows");
      }
    } catch (e, strackTrace) {
      log("${e.toString()}: ${strackTrace.toString()}");
      throw ServerException(e.toString());
    }
  }
}
