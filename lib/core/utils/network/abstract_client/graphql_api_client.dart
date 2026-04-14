import 'package:dio/dio.dart';
import 'package:smoth_movie_app/core/utils/network/abstract_client/abtract_dio_client.dart';
import 'package:smoth_movie_app/core/utils/network/types.dart';

abstract class GraphqlApiClient extends AbstractDioClient {
  GraphqlApiClient({required super.baseUrl});

  Future<Response<Json>> query(
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

  Future<Response<Json>> mutate(
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
