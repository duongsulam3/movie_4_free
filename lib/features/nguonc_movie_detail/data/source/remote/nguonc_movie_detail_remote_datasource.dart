import 'package:smoth_movie_app/common/core/error/exception.dart';
import 'package:smoth_movie_app/common/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/api/nguonc/nguonc_movie_detail_get.dart';
import 'package:smoth_movie_app/common/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/model/nguonc_movie_model.dart';

abstract interface class NguoncMovieDetailRemoteDatasource {
  Future<NguoncMovieModel> getNguoncMovieDetail({required String slug});
}

class NguoncMovieDetailRemoteDatasourceImpl
    implements NguoncMovieDetailRemoteDatasource {
  final AppService client;
  const NguoncMovieDetailRemoteDatasourceImpl({required this.client});
  @override
  Future<NguoncMovieModel> getNguoncMovieDetail({
    required String slug,
  }) async {
    try {
      final res = await NguonCMovieDetailGETAPI.apiNguonCGETMovieDetail(
        client: client,
        slug: slug,
      );

      return Helper.parseNguoncMovieDetail(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
