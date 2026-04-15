import 'package:dio/dio.dart';

import '../types.dart';
import 'abtract_dio_client.dart';

abstract class GraphqlApiClient extends AbstractDioClient {
  GraphqlApiClient({required super.baseUrl});

  Future<DioJsonResponse> query(
    String query, {
    Json? variables,
    Options? options,
  }) async {
    return await executeRequest(() => client.post(
          baseUrl,
          data: {'query': query, 'variables': variables},
          options: options,
        ));
  }

  Future<DioJsonResponse> mutate(
    String mutation, {
    Json? variables,
    Options? options,
  }) async {
    return await executeRequest(() => client.post(
          baseUrl,
          data: {'query': mutation, 'variables': variables},
          options: options,
        ));
  }
}
