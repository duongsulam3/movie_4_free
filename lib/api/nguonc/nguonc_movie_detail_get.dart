import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/common/utils/network/types.dart';
import 'package:smoth_movie_app/common/utils/secret/app_secret.dart';

final class NguonCMovieDetailGETAPI {
  static Future<DioJsonResponse> apiNguonCGETMovieDetail({
    required AppService client,
    required String slug,
  }) {
    final url = "${AppSecret.nguoncPhimUrl}/film/$slug";
    return client.getRequest(url);
  }
}
