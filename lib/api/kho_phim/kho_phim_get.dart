import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/common/utils/network/types.dart';
import 'package:smoth_movie_app/common/utils/secret/api_end_point.dart';
import 'package:smoth_movie_app/common/utils/secret/app_secret.dart';

/// API layer for Kho Phim feature.
///
/// This file keeps all HTTP request/URL building out of the data layer.
final class KhoPhimGETAPI {
  static Future<DioJsonResponse> apiKhoPhimGETCategories({
    required AppService client,
  }) {
    return client.getRequest(ApiEndPoint.categoriesEndpoint);
  }

  static Future<DioJsonResponse> apiKhoPhimGETCountries({
    required AppService client,
  }) {
    return client.getRequest(ApiEndPoint.countriesEndpoint);
  }

  static Future<DioJsonResponse> apiKhoPhimGETMovies({
    required AppService client,
    required String countrySlug,
    required int page,
    required String sortField,
    required String sortType,
    required String lang,
    required String categorySlug,
    required String year,
    required int limit,
  }) {
    final url =
        "${AppSecret.apiv1Url}${ApiEndPoint.countriesEndpoint}/$countrySlug?page=$page&sort_field=$sortField&sort_type=$sortType&sort_lang=$lang&category=$categorySlug&year=$year&limit=$limit";

    // Full URL is passed intentionally because Kho Phim uses another domain.
    return client.getRequest(url);
  }
}
