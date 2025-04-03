import 'dart:isolate';

import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:http/http.dart' as http;

abstract interface class SimilarMoviesRemoteDataSource {
  Future<List<MovieItemModel>> getSimilarMovies({required String categorySlug});
}

class SimilarMoviesRemoteDataSourceImpl
    implements SimilarMoviesRemoteDataSource {
  final http.Client client;
  const SimilarMoviesRemoteDataSourceImpl(this.client);
  @override
  Future<List<MovieItemModel>> getSimilarMovies({
    required String categorySlug,
  }) async {
    try {
      final url = "${AppSecret.kkPhimUrl}/the-loai/$categorySlug?limit=18";
      final uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        return Isolate.run(() => Helper.parseMovies(res.body));
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu phim tương tự");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
