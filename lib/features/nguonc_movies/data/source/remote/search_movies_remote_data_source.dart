import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/features/nguonc_movies/data/model/nguonc_movie_item_model.dart';

abstract interface class NguonCSearchMoviesRemoteDataSource {
  Future<List<NguoncMovieItemModel>> searchFilms({
    required String query,
    required int page,
  });
}

class NguonCSearchMoviesRemoteDataSourceImpl
    implements NguonCSearchMoviesRemoteDataSource {
  final http.Client client;
  const NguonCSearchMoviesRemoteDataSourceImpl(this.client);
  @override
  Future<List<NguoncMovieItemModel>> searchFilms({
    required String query,
    required int page,
  }) async {
    try {
      var url =
          "${AppSecret.nguoncPhimUrl}/films/search?keyword=$query&page=$page";
      final uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        return Helper.parseNguoncSearchMovies(res.body);
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu tìm kiếm phim");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
