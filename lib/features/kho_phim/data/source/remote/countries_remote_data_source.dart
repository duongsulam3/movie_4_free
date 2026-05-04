import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/utils/helper/helper.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
import 'package:smoth_movie_app/api/kho_phim/kho_phim_get.dart';
import 'package:smoth_movie_app/features/kho_phim/data/model/kho_phim_country_model.dart';

abstract interface class CountriesRemoteDataSource {
  Future<List<KhoPhimCountryModel>> getCountries();
}

class CountriesRemoteDataSourceImpl implements CountriesRemoteDataSource {
  final AppService client;
  const CountriesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<KhoPhimCountryModel>> getCountries() async {
    try {
      final res = await KhoPhimGETAPI.apiKhoPhimGETCountries(client: client);

      return Helper.parseKhoPhimCoutryJsonToList(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
