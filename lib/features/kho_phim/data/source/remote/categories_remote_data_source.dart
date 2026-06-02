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
      final result = await client.parseJson<List<KhoPhimCategoryModel>>(() {
        final items = jsonRes as List<dynamic>;
        return List.generate(items.length, (i) {
          return KhoPhimCategoryModel.fromJson(items[i]);
        });
      });

      // Add "All" category at the beginning of the list
      result.insert(
        0,
        const KhoPhimCategoryModel(id: '0', name: 'Tất cả', slug: ''),
      );

      // Return the list of categories
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
