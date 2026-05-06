import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/api/movies/movies_get.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

abstract interface class SimilarMoviesRemoteDataSource {
  Future<List<MovieItemModel>> getSimilarMovies({required String categorySlug});
}

class SimilarMoviesRemoteDataSourceImpl
    implements SimilarMoviesRemoteDataSource {
  final AppService client;
  const SimilarMoviesRemoteDataSourceImpl(this.client);
  @override
  Future<List<MovieItemModel>> getSimilarMovies({
    required String categorySlug,
  }) async {
    try {
      final res = await MoviesGETAPI.apiMoviesGETSimilar(
        client: client,
        categorySlug: categorySlug,
      );
      final jsonRes = client.decodeJsonResponse(res.data);
      return client.parseJson<List<MovieItemModel>>(() {
        final items = jsonRes["data"]["items"] as List<dynamic>;
        return items.map((e) => MovieItemModel.fromJson(e)).toList();
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
