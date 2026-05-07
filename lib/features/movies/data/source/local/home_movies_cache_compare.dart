import 'dart:convert';

import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

class HomeMoviesCacheCompare {
  const HomeMoviesCacheCompare._();

  static bool moviesEquals(
    List<MovieItemModel> oldData,
    List<MovieItemModel> newData,
  ) {
    if (oldData.length != newData.length) return false;
    final oldJson = jsonEncode(oldData.map((e) => e.toJson()).toList());
    final newJson = jsonEncode(newData.map((e) => e.toJson()).toList());
    return oldJson == newJson;
  }

  static bool recentlyEquals(
    List<RecentlyUpdateListItemModel> oldData,
    List<RecentlyUpdateListItemModel> newData,
  ) {
    if (oldData.length != newData.length) return false;
    final oldJson = jsonEncode(oldData.map((e) => e.toJson()).toList());
    final newJson = jsonEncode(newData.map((e) => e.toJson()).toList());
    return oldJson == newJson;
  }
}
