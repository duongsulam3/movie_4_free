import 'package:dio/dio.dart';
import 'package:smoth_movie_app/core/utils/network/abstract_client/abtract_dio_client.dart';
import 'package:smoth_movie_app/core/utils/network/types.dart';

abstract class RestfulApiClient extends AbstractDioClient {
  RestfulApiClient({required super.baseUrl});

  Future<Response<Json>> getRequest(
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

  Future<Response<Json>> postRequest(
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

  Future<Response<Json>> putRequest(
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

  Future<Response<Json>> deleteRequest(
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
