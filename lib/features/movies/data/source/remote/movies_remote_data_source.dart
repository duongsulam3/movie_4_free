import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/common/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/source/worker/home_movies_fetch_worker.dart';

abstract interface class MoviesRemoteDataSource {
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  });
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final AppService client;
  const MoviesRemoteDataSourceImpl({required this.client});

  Future<List<MovieItemModel>> getMoviesInIsolate({
    required int page,
    required int limit,
    required String cateName,
  }) {
    return HomeMoviesFetchWorker.fetchMovies(
      baseUrl: AppSecret.baseUrl,
      page: page,
      limit: limit,
      cateName: cateName,
    );
  }

  @override
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  }) async {
    try {
      // Keep Home API fetch/parse off the main isolate to reduce jank.
      return await getMoviesInIsolate(
        page: page,
        limit: limit,
        cateName: cateName,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
