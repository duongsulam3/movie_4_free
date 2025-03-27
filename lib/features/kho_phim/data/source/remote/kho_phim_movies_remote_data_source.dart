import 'dart:convert';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:http/http.dart' as http;

abstract interface class KhoPhimMoviesRemoteDataSource {
  Future<List<MovieItemModel>> getKhoPhimMovies({
    required String countrySlug,
    required int page,
    required String sortField,
    required String sortType,
    required String lang,
    required String categorySlug,
    required String year,
    required int limit,
  });
}

class KhoPhimMoviesRemoteDataSourceImpl
    implements KhoPhimMoviesRemoteDataSource {
  final http.Client client;
  const KhoPhimMoviesRemoteDataSourceImpl(this.client);
  @override
  Future<List<MovieItemModel>> getKhoPhimMovies({
    required String countrySlug,
    required int page,
    required String sortField,
    required String sortType,
    required String lang,
    required String categorySlug,
    required String year,
    required int limit,
  }) async {
    try {
      final url =
          "${AppSecret.kkPhimUrl}${ApiEndPoint.countriesEndpoint}/$countrySlug?page=$page&sort_field=$sortField&sort_type=$sortType&sort_lang=$lang&category=$categorySlug&year=$year&limit=$limit";
      final uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        final jsonRes = jsonDecode(res.body)["data"]["items"] as List;
        List<MovieItemModel> data =
            jsonRes.map((e) => MovieItemModel.fromJson(e)).toList();
        return data;
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu phim từ server");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
