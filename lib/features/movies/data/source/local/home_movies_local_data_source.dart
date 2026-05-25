import 'package:hive/hive.dart';
import 'package:smoth_movie_app/common/local/hive_boxes.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

abstract interface class HomeMoviesLocalDataSource {
  Future<List<MovieItemModel>> getMovies({
    required String cateName,
    required int limit,
  });
  Future<void> saveMovies({
    required String cateName,
    required int limit,
    required List<MovieItemModel> movies,
  });

  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdated();
  Future<void> saveRecentlyUpdated(List<RecentlyUpdateListItemModel> movies);
}

class HomeMoviesLocalDataSourceImpl implements HomeMoviesLocalDataSource {
  HomeMoviesLocalDataSourceImpl(this.box);

  final Box<dynamic> box;

  @override
  Future<List<MovieItemModel>> getMovies({
    required String cateName,
    required int limit,
  }) async {
    final raw = box.get(HiveKeys.getKeyMoviesByCategory(cateName));
    if (raw is! List) return const [];
    return List.generate(raw.length, (index) => raw[index] as MovieItemModel);
  }

  @override
  Future<void> saveMovies({
    required String cateName,
    required int limit,
    required List<MovieItemModel> movies,
  }) async {
    await box.put(HiveKeys.getKeyMoviesByCategory(cateName), movies);
  }

  @override
  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdated() async {
    final raw = box.get(HiveKeys.recentlyUpdated);
    if (raw is! List) return const [];
    return List.generate(
      raw.length,
      (index) => raw[index] as RecentlyUpdateListItemModel,
    );
  }

  @override
  Future<void> saveRecentlyUpdated(
    List<RecentlyUpdateListItemModel> movies,
  ) async {
    await box.put(HiveKeys.recentlyUpdated, movies);
  }
}
