import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smoth_movie_app/core/utils/network/abstract_client/restful_api_client.dart';

class AppService extends RestfulApiClient {
  AppService({required super.baseUrl});

  static AppService? _instance;

  static void initialize({required String baseUrl}) {
    _instance = AppService(baseUrl: baseUrl);

    log("Network service initialized with base URL: $baseUrl");
  }

  static AppService get shared {
    if (_instance == null) {
      throw Exception('AppServices not initialized. !!');
    }
    return _instance!;
  }

  @override
  void applyAuthentication(RequestOptions options) {
    // TODO: implement applyAuthentication
  }

  @override
  Future<void> onUnauthorized(RequestOptions requestOptions) {
    // TODO: implement onUnauthorized
    throw UnimplementedError();
  }

  @override
  Exception handleErrors(DioException e) {
    // TODO: implement handleErrors
    throw UnimplementedError();
  }
}
