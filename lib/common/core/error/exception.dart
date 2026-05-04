import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  final int? statusCode;
  final DioExceptionType? type;

  const ServerException(
    this.message, {
    this.statusCode,
    this.type,
  });

  @override
  String toString() {
    final code = statusCode != null ? '[$statusCode] ' : '';
    return '${code}ServerException: $message';
  }
}
