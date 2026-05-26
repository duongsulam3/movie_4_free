import 'package:flutter/foundation.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

abstract class MoviesCompare<T> {
  const MoviesCompare({
    required this.oldData,
    required this.newData,
  });

  final T oldData;
  final T newData;

  bool compare();
}

final class MovieItemListCompare extends MoviesCompare<List<MovieItemModel>> {
  const MovieItemListCompare({
    required super.oldData,
    required super.newData,
  });

  @override
  bool compare() => listEquals(oldData, newData);
}

final class RecentlyUpdateListCompare
    extends MoviesCompare<List<RecentlyUpdateListItemModel>> {
  const RecentlyUpdateListCompare({
    required super.oldData,
    required super.newData,
  });

  @override
  bool compare() => listEquals(oldData, newData);
}

bool _movieItemListCompareWorker(MovieItemListCompare input) => input.compare();

bool _recentlyUpdateListCompareWorker(RecentlyUpdateListCompare input) =>
    input.compare();

class HomeMoviesCacheCompare {
  const HomeMoviesCacheCompare._();

  static Future<bool> moviesEquals(
    List<MovieItemModel> oldData,
    List<MovieItemModel> newData,
  ) {
    return _equalsInBackground(
      oldData: oldData,
      newData: newData,
      deepCompare: () => compute(
        _movieItemListCompareWorker,
        MovieItemListCompare(oldData: oldData, newData: newData),
      ),
    );
  }

  static Future<bool> recentlyEquals(
    List<RecentlyUpdateListItemModel> oldData,
    List<RecentlyUpdateListItemModel> newData,
  ) {
    return _equalsInBackground(
      oldData: oldData,
      newData: newData,
      deepCompare: () => compute(
        _recentlyUpdateListCompareWorker,
        RecentlyUpdateListCompare(oldData: oldData, newData: newData),
      ),
    );
  }

  static Future<bool> _equalsInBackground<T>({
    required List<T> oldData,
    required List<T> newData,
    required Future<bool> Function() deepCompare,
  }) async {
    if (identical(oldData, newData)) return true;
    if (oldData.isEmpty && newData.isEmpty) return true;
    if (oldData.length != newData.length) return false;
    return deepCompare();
  }
}
