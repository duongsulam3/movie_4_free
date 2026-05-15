import 'package:flutter_supper_app_core/core.dart';

import '../../common/utils/network/app_service.dart';
import '../../common/utils/network/types.dart';
import '../../common/utils/secret/app_secret.dart';

/// API layer for Recommend Movies feature (IMDB Top 100 via RapidAPI).
final class RecommendMoviesGETAPI {
  static Future<DioJsonResponse> apiGetRecommendMovies({
    required AppService client,
  }) async {
    return client.getRequest(
      AppSecret.imdbTop100Endpoint,
      options: Options(
        headers: {
          'x-rapidapi-key': AppSecret.xRapidapiKey,
        },
      ),
    );
  }
}
