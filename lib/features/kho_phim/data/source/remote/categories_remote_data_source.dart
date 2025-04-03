import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/api_end_point.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/kho_phim/data/model/kho_phim_category_model.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<List<KhoPhimCategoryModel>> getCategories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final http.Client client;
  const CategoriesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<KhoPhimCategoryModel>> getCategories() async {
    try {
      var url = AppSecret.baseUrl + ApiEndPoint.categoriesEndpoint;
      var uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        return Helper.parseKhoPhimCateJsonToList(res.body);
      } else {
        throw const ServerException("Lỗi khi lấy danh sách thể loại");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
