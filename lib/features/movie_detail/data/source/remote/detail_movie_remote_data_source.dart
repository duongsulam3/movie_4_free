import 'package:smoth_movie_app/api/movie_detail/detail_get.dart';
import 'package:smoth_movie_app/common/core/error/exception.dart';
import 'package:smoth_movie_app/common/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/common/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/movie_detail.dart';

abstract interface class DetailMovieRemoteDataSource {
  Future<MovieDetailModel> getDetailMovie({required String slug});
}

class DetailMovieRemoteDataSourceImpl implements DetailMovieRemoteDataSource {
  final AppService client;
  const DetailMovieRemoteDataSourceImpl({required this.client});

  @override
  Future<MovieDetailModel> getDetailMovie({required String slug}) async {
    try {
      final res = await DetailMovieGETAPI.apiDetailGETMovie(
        client: client,
        slug: slug,
      );
      return Helper.parseMovieDetail(res.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
