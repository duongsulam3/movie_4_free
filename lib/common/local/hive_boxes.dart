import 'package:smoth_movie_app/common/utils/secret/app_secret.dart';

class HiveBoxes {
  const HiveBoxes._();

  static const String homeMoviesCache = 'home_movies_cache_box';
  static const String searchHistoryCache = 'search_history_cache_box';
}

class HiveKeys {
  const HiveKeys._();

  static const String recentlyUpdated = 'recently_updated';
  static const String searchHistory = 'search_history';

  static String getKeyMoviesByCategory() {
    return AppSecret.moviesByCategoryKey;
  }
}
