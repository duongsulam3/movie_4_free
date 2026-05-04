import 'package:smoth_movie_app/common/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/common/core/utils/network/types.dart';
import 'package:smoth_movie_app/common/core/utils/secret/api_end_point.dart';
import 'package:smoth_movie_app/common/core/utils/secret/app_secret.dart';

/// API layer for Movies feature.
///
/// All HTTP URL building / request execution lives here (not in data layer).
final class MoviesGETAPI {
  static Future<DioJsonResponse> apiMoviesGETMovies({
    required AppService client,
    required int page,
    required int limit,
    required String cateName,
  }) {
    // kkPhimUrl = https://phimapi.com/v1/api
    // AppSecret.apiv1Url = /v1/api
    final endpoint =
        "${AppSecret.apiv1Url}/danh-sach/$cateName?page=$page&limit=$limit";
    return client.getRequest(endpoint);
  }

  static Future<DioJsonResponse> apiMoviesGETRecentlyUpdate({
    required AppService client,
  }) {
    return client.getRequest(ApiEndPoint.recentlyUpdateEndPoint);
  }

  static Future<DioJsonResponse> apiMoviesSortbyModifiedTimeGET({
    required AppService client,
    required int page,
    required int limit,
    required String sortfield,
    required String cateName,
  }) {
    final endpoint =
        "${AppSecret.apiv1Url}/danh-sach/$cateName?page=$page&sortfield=$sortfield&limit=$limit";
    return client.getRequest(endpoint);
  }

  static Future<DioJsonResponse> apiMoviesGETSimilar({
    required AppService client,
    required String categorySlug,
  }) {
    final endpoint = "${AppSecret.apiv1Url}/the-loai/$categorySlug?limit=18";
    return client.getRequest(endpoint);
  }
}
