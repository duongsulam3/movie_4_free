import 'package:smoth_movie_app/api/nguonc/nguonc_movies_by_category_get.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/nguonc_categories/data/model/nguonc_movies_by_category_item_model.dart';

abstract interface class NguoncMoviesByCategoryRemoteDatasource {
  Future<List<NguoncMoviesByCategoryItemModel>> getMoviesByCategory(
    String slug,
    int page,
  );
}

class NguoncMoviesByCategoryRemoteDatasourceImpl
    implements NguoncMoviesByCategoryRemoteDatasource {
  final AppService client;
  const NguoncMoviesByCategoryRemoteDatasourceImpl({required this.client});
  @override
  Future<List<NguoncMoviesByCategoryItemModel>> getMoviesByCategory(
    String slug,
    int page,
  ) async {
    try {
      final res = await NguonCMoviesByCategoryGETAPI.apiNguonCGETMoviesByCategory(
        client: client,
        slug: slug,
        page: page,
      );

      return Helper.parseNguoncMoviesByCategory(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
