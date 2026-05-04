import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/helper/helper.dart';
import 'package:smoth_movie_app/api/nguonc/nguonc_search_get.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/model/nguonc_movie_item_model.dart';

abstract interface class NguonCSearchMoviesRemoteDataSource {
  Future<List<NguoncMovieItemModel>> searchFilms({
    required String query,
    required int page,
  });
}

class NguonCSearchMoviesRemoteDataSourceImpl
    implements NguonCSearchMoviesRemoteDataSource {
  final AppService client;
  const NguonCSearchMoviesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<NguoncMovieItemModel>> searchFilms({
    required String query,
    required int page,
  }) async {
    try {
      final res = await NguonCSearchGETAPI.apiNguonCSearchGETFilms(
        client: client,
        query: query,
        page: page,
      );

      return Helper.parseNguoncSearchMovies(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
