import 'package:smoth_movie_app/api/movies/movies_get.dart';
import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

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

  @override
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String cateName,
  }) async {
    try {
      final res = await MoviesGETAPI.apiMoviesGETMovies(
        client: client,
        page: page,
        limit: limit,
        cateName: cateName,
      );

      final jsonRes = client.decodeJsonResponse(res.data);

      final parsed = client.parseJson<List<MovieItemModel>>(() {
        final items = jsonRes['data']['items'] as List<dynamic>;
        return List.generate(
          items.length,
          (e) => MovieItemModel.fromJson(items[e]),
        );
      });

      return parsed;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
