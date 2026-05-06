import 'package:smoth_movie_app/api/movie_detail/detail_get.dart';
import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
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
      final jsonRes = client.decodeJsonResponse(res.data);
      return client.parseJson<MovieDetailModel>(
        () => MovieDetailModel.fromJson(jsonRes),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
