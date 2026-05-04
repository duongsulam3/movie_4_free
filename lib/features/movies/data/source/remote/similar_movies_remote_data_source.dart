import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/helper/helper.dart';
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
      return Helper.parseMovies(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
