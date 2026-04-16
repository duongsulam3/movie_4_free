import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/core/utils/secret/api_end_point.dart';
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
      final res = await client.getRequest(ApiEndPoint.countriesEndpoint);

      return Helper.parseKhoPhimCoutryJsonToList(res.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
