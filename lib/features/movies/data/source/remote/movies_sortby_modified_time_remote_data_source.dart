import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/helper/helper.dart';
import 'package:smoth_movie_app/api/movies/movies_get.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

abstract interface class MoviesSortbyModifiedTimeRemoteDataSource {
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String sortfield,
    required String cateName,
  });
}

class MoviesSortbyModifiedTimeRemoteDataSourceImpl
    implements MoviesSortbyModifiedTimeRemoteDataSource {
  final AppService client;
  const MoviesSortbyModifiedTimeRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String sortfield,
    required String cateName,
  }) async {
    try {
      final res = await MoviesGETAPI.apiMoviesSortbyModifiedTimeGET(
        client: client,
        page: page,
        limit: limit,
        sortfield: sortfield,
        cateName: cateName,
      );
      return Helper.parseMovies(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
