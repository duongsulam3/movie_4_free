import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../error/exception.dart';
import '../helper/dev_logger.dart';

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

  @override
  dynamic decodeJsonResponse(data) {
    try {
      if (data is! String) {
        // If data is not a String, encode it to String JSON.
        final encoded = jsonEncode(data);
        return jsonDecode(encoded);
      }

      // If data is already a String, we can directly decode it.
      return jsonDecode(data);
    } catch (e) {
      logger.error('Error decoding JSON response', e);
      throw const ServerException("Failed to decode JSON response");
    }
  }

  // Generic method to parse JSON using a provided mapper function.
  T parseJson<T>(T Function() mapper) {
    try {
      return mapper();
    } catch (e) {
      logger.error('Error parsing JSON to model', e);
      throw const ServerException("Failed to parse JSON to model");
    }
  }
}
