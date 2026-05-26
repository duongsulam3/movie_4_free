import 'package:flutter/foundation.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

class HomeMoviesCacheCompare {
  const HomeMoviesCacheCompare._();

  static bool moviesEquals(
    List<MovieItemModel> oldData,
    List<MovieItemModel> newData,
  ) {
    return listEquals(oldData, newData);
  }

  static bool recentlyEquals(
    List<RecentlyUpdateListItemModel> oldData,
    List<RecentlyUpdateListItemModel> newData,
  ) {
    return listEquals(oldData, newData);
  }
}
