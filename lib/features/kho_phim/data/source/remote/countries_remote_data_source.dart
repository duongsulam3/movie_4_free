import 'dart:convert';

import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/kho_phim/data/model/kho_phim_country_model.dart';
import 'package:http/http.dart' as http;

abstract interface class CountriesRemoteDataSource {
  Future<List<KhoPhimCountryModel>> getCountries();
}

class CountriesRemoteDataSourceImpl implements CountriesRemoteDataSource {
  final http.Client client;
  const CountriesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<KhoPhimCountryModel>> getCountries() async {
    try {
      var url = AppSecret.baseUrl + ApiEndPoint.countriesEndpoint;
      var uri = Uri.parse(url);
      final res = await client.get(uri);
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body) as List;
        List<KhoPhimCountryModel> categories =
            jsonResponse.map((e) => KhoPhimCountryModel.fromJson(e)).toList();
        return categories;
      } else {
        throw const ServerException("Lỗi khi lấy danh sách thể loại");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
