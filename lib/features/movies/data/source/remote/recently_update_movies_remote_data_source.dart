import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/api_end_point.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';

abstract interface class RecentlyUpdateMoviesRemoteDataSource {
  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdateMovies();
}

class RecentlyUpdateMoviesRemoteDataSourceImpl
    implements RecentlyUpdateMoviesRemoteDataSource {
  final http.Client client;
  const RecentlyUpdateMoviesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RecentlyUpdateListItemModel>> getRecentlyUpdateMovies() async {
    try {
      var url = AppSecret.baseUrl + ApiEndPoint.recentlyUpdateEndPoint;
      final uri = Uri.parse(url);
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return Helper.parseRecentlyMovies(response.body);
      } else {
        throw const ServerException("Lỗi khi lấy dữ liệu: phim mới cập nhật");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
