import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/api_end_point.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
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
      final endpoint = "${ApiEndPoint.detailMovieEndpoint}$slug";
      final res = await client.getRequest(endpoint);
      return Helper.parseMovieDetail(res.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
