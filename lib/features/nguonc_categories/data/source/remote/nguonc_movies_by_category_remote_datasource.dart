import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/nguonc_categories/data/model/nguonc_movies_by_category_item_model.dart';
import 'package:http/http.dart' as http;

abstract interface class NguoncMoviesByCategoryRemoteDatasource {
  Future<List<NguoncMoviesByCategoryItemModel>> getMoviesByCategory(
    String slug,
    int page,
  );
}

class NguoncMoviesByCategoryRemoteDatasourceImpl
    implements NguoncMoviesByCategoryRemoteDatasource {
  final http.Client client;
  const NguoncMoviesByCategoryRemoteDatasourceImpl(this.client);
  @override
  Future<List<NguoncMoviesByCategoryItemModel>> getMoviesByCategory(
    String slug,
    int page,
  ) async {
    try {
      var url = "${AppSecret.nguoncPhimUrl}/films/the-loai/$slug?page=$page";
      final uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        return Helper.parseNguoncMoviesByCategory(res.body);
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu tìm kiếm phim");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
