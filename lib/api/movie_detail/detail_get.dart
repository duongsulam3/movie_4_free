import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/common/utils/network/types.dart';
import 'package:smoth_movie_app/common/utils/secret/api_end_point.dart';

final class DetailMovieGETAPI {
  static const String endpoint = ApiEndPoint.detailMovieEndpoint;

  static Future<DioJsonResponse> apiDetailGETMovie({
    required AppService client,
    required String slug,
  }) async {
    return client.getRequest('$endpoint$slug');
  }
}
