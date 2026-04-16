import 'package:dio/dio.dart';

import '../../error/exception.dart';
import '../helper/dev_logger.dart';
import 'abstract_client/restful_api_client.dart';

class AppService extends RestfulApiClient {
  AppService({required super.baseUrl});

  static AppService? _instance;

  static void initialize({required String baseUrl}) {
    _instance = AppService(baseUrl: baseUrl);
  }

  static AppService get shared {
    if (_instance == null) {
      throw Exception('AppServices not initialized. !!');
    }
    return _instance!;
  }

  Logger get logger => const Logger(className: "AppService");

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
    return const ServerException("Error message");
  }

  @override
  void debugStatusLog(Response<dynamic> response) {
    final method = response.requestOptions.method;
    final uri = response.requestOptions.uri;
    final statusCode = response.statusCode;

    logger.debug('DIO RESPONSE', '$method Status Code: $statusCode' '\n$uri');
  }
}
