import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/helper/helper.dart';
import 'package:smoth_movie_app/api/movies/movies_get.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';

abstract interface class RecentlyUpdateMoviesRemoteDataSource {
  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdateMovies();
}

class RecentlyUpdateMoviesRemoteDataSourceImpl
    implements RecentlyUpdateMoviesRemoteDataSource {
  final AppService client;
  const RecentlyUpdateMoviesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdateMovies() async {
    try {
      final res = await MoviesGETAPI.apiMoviesGETRecentlyUpdate(client: client);
      return Helper.parseRecentlyMovies(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
