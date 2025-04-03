import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
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
  final http.Client client;
  const SearchMovieRemoteDatasourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getSearchMovies({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      var url =
          "${AppSecret.kkPhimUrl + ApiEndPoint.searchMoviesEndpoint}keyword=$query&page=$page&sort_lang=vietsub&limit=$limit";
      final uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        return Helper.parseMovies(res.body);
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu tìm kiếm phim");
      }
    } catch (e, strackTrace) {
      log("${e.toString()}: ${strackTrace.toString()}");
      throw ServerException(e.toString());
    }
  }
}
