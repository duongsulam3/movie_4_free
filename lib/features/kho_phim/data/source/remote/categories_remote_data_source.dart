import 'package:smoth_movie_app/api/kho_phim/kho_phim_get.dart';
import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/features/kho_phim/data/model/kho_phim_category_model.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<List<KhoPhimCategoryModel>> getCategories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final AppService client;
  const CategoriesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<KhoPhimCategoryModel>> getCategories() async {
    try {
      final res = await KhoPhimGETAPI.apiKhoPhimGETCategories(client: client);
      final jsonRes = client.decodeJsonResponse(res.data);
      return client.parseJson<List<KhoPhimCategoryModel>>(() {
        final items = jsonRes as List<dynamic>;
        final cate = items.map((e) => KhoPhimCategoryModel.fromJson(e)).toList();
        cate.insert(
          0,
          KhoPhimCategoryModel(
            id: "0",
            name: "Tất cả thể loại",
            slug: "",
          ),
        );
        return cate;
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
