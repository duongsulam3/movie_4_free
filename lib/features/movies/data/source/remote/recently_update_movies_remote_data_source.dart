import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/common/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/source/worker/home_movies_fetch_worker.dart';

abstract interface class RecentlyUpdateMoviesRemoteDataSource {
  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdateMovies();
}

class RecentlyUpdateMoviesRemoteDataSourceImpl
    implements RecentlyUpdateMoviesRemoteDataSource {
  final AppService client;
  const RecentlyUpdateMoviesRemoteDataSourceImpl({required this.client});

  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdateMoviesInIsolate() {
    return HomeMoviesFetchWorker.fetchRecentlyUpdated(baseUrl: AppSecret.baseUrl);
  }

  @override
  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdateMovies() async {
    try {
      // Keep Home API fetch/parse off the main isolate to reduce jank.
      return await getRecentlyUpdateMoviesInIsolate();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
