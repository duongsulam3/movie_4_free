import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/model/nguonc_movie_model.dart';

import 'package:http/http.dart' as http;

abstract interface class NguoncMovieDetailRemoteDatasource {
  Future<NguoncMovieModel> getNguoncMovieDetail({required String slug});
}

class NguoncMovieDetailRemoteDatasourceImpl
    implements NguoncMovieDetailRemoteDatasource {
  final http.Client client;
  const NguoncMovieDetailRemoteDatasourceImpl(this.client);
  @override
  Future<NguoncMovieModel> getNguoncMovieDetail({required String slug}) async {
    try {
      var url = "${AppSecret.nguoncPhimUrl}/film/$slug";
      final uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        return Helper.parseNguoncMovieDetail(res.body);
      } else {
        throw ServerException("Lỗi khi lấy dữ liệu: chi tiết phim: $slug");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
