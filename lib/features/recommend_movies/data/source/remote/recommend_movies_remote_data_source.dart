import '../../../../../api/recommend_movies/recommend_movies_api.dart';
import '../../../../../common/error/exception.dart';
import '../../../../../common/utils/network/app_service.dart';
import '../../model/recommend_movie_model.dart';

abstract interface class RecommendMoviesRemoteDataSource {
  Future<List<RecommendMovieModel>> getRecommendMovies();
}

class RecommendMoviesRemoteDataSourceImpl
    implements RecommendMoviesRemoteDataSource {
  final AppService client;
  const RecommendMoviesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RecommendMovieModel>> getRecommendMovies() async {
    try {
      final res = await RecommendMoviesGETAPI.apiGetRecommendMovies(
        client: client,
      );

      // Decode JSON
      final jsonRes = client.decodeJsonResponse(res.data);

      // Parse JSON
      final parsed = await client.parseJson<List<RecommendMovieModel>>(() {
        final items = jsonRes as List<dynamic>;
        return List.generate(
          items.length,
          (i) => RecommendMovieModel.fromJson(items[i]),
        );
      });

      // Return
      return parsed;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
