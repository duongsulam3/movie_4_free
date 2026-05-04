import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/common/utils/network/types.dart';
import 'package:smoth_movie_app/common/utils/secret/app_secret.dart';

final class NguonCMoviesByCategoryGETAPI {
  static Future<DioJsonResponse> apiNguonCGETMoviesByCategory({
    required AppService client,
    required String slug,
    required int page,
  }) {
    final url = "${AppSecret.nguoncPhimUrl}/films/the-loai/$slug?page=$page";
    return client.getRequest(url);
  }
}
