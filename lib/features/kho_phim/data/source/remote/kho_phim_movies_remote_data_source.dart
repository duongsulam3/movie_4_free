import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/api/kho_phim/kho_phim_get.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

abstract interface class KhoPhimMoviesRemoteDataSource {
  Future<List<MovieItemModel>> getKhoPhimMovies({
    required String countrySlug,
    required int page,
    required String sortField,
    required String sortType,
    required String lang,
    required String categorySlug,
    required String year,
    required int limit,
  });
}

class KhoPhimMoviesRemoteDataSourceImpl
    implements KhoPhimMoviesRemoteDataSource {
  final AppService client;
  const KhoPhimMoviesRemoteDataSourceImpl(this.client);
  @override
  Future<List<MovieItemModel>> getKhoPhimMovies({
    required String countrySlug,
    required int page,
    required String sortField,
    required String sortType,
    required String lang,
    required String categorySlug,
    required String year,
    required int limit,
  }) async {
    try {
      final res = await KhoPhimGETAPI.apiKhoPhimGETMovies(
        client: client,
        countrySlug: countrySlug,
        page: page,
        sortField: sortField,
        sortType: sortType,
        lang: lang,
        categorySlug: categorySlug,
        year: year,
        limit: limit,
      );

      return Helper.parseKhoPhimMovies(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
