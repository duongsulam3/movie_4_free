import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:http/http.dart' as http;

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
  final http.Client client;
  const MoviesSortbyModifiedTimeRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieItemModel>> getMovies({
    required int page,
    required int limit,
    required String sortfield,
    required String cateName,
  }) async {
    try {
      var url =
          "${AppSecret.kkPhimUrl}/danh-sach/$cateName?page=$page&sortfield=$sortfield&limit=$limit";
      final uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        return Helper.parseMovies(res.body);
      } else {
        throw ServerException(
          "Lỗi khi lấy dữ liệu phim $cateName mới cập nhật",
        );
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
