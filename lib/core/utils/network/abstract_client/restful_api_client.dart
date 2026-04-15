import 'package:dio/dio.dart';

import '../types.dart';
import 'abtract_dio_client.dart';

abstract class RestfulApiClient extends AbstractDioClient {
  RestfulApiClient({required super.baseUrl});

  Future<DioJsonResponse> getRequest(
    String endpoint, {
    Json? queryParameters,
    Options? options,
  }) async {
    return executeRequest(() => client.get(
          endpoint,
          queryParameters: queryParameters,
          options: options,
        ));
  }

  Future<DioJsonResponse> postRequest(
    String endpoint, {
    Json? data,
    Json? queryParameters,
    Options? options,
  }) async {
    return executeRequest(() => client.post(
          endpoint,
          data: data,
          queryParameters: queryParameters,
          options: options,
        ));
  }

  Future<DioJsonResponse> putRequest(
    String endpoint, {
    Json? data,
    Json? queryParameters,
    Options? options,
  }) async {
    return executeRequest(() => client.put(
          endpoint,
          data: data,
          queryParameters: queryParameters,
          options: options,
        ));
  }

  Future<DioJsonResponse> deleteRequest(
    String endpoint, {
    Json? data,
    Json? queryParameters,
    Options? options,
  }) async {
    return executeRequest(() => client.delete(
          endpoint,
          data: data,
          queryParameters: queryParameters,
          options: options,
        ));
  }
}
