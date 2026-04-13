import 'package:dio/dio.dart';
import 'package:smoth_movie_app/core/utils/network/types.dart';

abstract class AbstractDioClient {
  final Dio client;
  final CancelToken cancelToken = CancelToken();
  final BaseOptions baseOptions = BaseOptions(contentType: "application/json");
  final String baseUrl;

  AbstractDioClient({required this.baseUrl, Dio? dioInstance})
      : client = dioInstance ?? Dio() {
    client.options = baseOptions;
    client.options.baseUrl = baseUrl;
    init();
  }

  Future<void> init() async {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          options.cancelToken = cancelToken;
          applyAuthentication(options);
          return handler.next(options);
        },
        onResponse: (Response response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  void applyAuthentication(RequestOptions options);
  Future<void> onUnauthorized(RequestOptions requestOptions);

  Future<Response<Json>> executeRequest(
    Future<Response<Json>> Function() request,
  ) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  static bool shouldHandleUnauthorized(int? statusCode) {
    return statusCode == 403 || statusCode == 401;
  }

  void cancelAllRequests() {
    cancelToken.cancel();
  }
}
