import 'package:smoth_movie_app/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/core/utils/network/types.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';

/// API layer for Nguồn C search.
/// Keep URL construction out of the data layer.
final class NguonCSearchGETAPI {
  static Future<DioJsonResponse> apiNguonCSearchGETFilms({
    required AppService client,
    required String query,
    required int page,
  }) {
    final keyword = Uri.encodeQueryComponent(query);
    final url =
        "${AppSecret.nguoncPhimUrl}/films/search?keyword=$keyword&page=$page";
    return client.getRequest(url);
  }
}

