import 'package:smoth_movie_app/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/core/utils/network/types.dart';
import 'package:smoth_movie_app/core/utils/secret/api_end_point.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';

final class SearchGETAPI {
  static const String apiVersion = AppSecret.apiv1Url;
  static const String endpoint = ApiEndPoint.searchMoviesEndpoint;

  static Future<DioJsonResponse> apiSearchGETMovies({
    required AppService client,
    required String query,
    int? page = 1,
    int? limit = 10,
    String? sortLang = "vietsub",
  }) async {
    final params = 'keyword=$query&page=$page&sort_lang=$sortLang&limit=$limit';
    return client.getRequest(apiVersion + endpoint + params);
  }
}
