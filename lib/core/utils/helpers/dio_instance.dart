
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A class that provides a singleton instance of [Dio].
/// This class is annotated with `@Singleton` to make sure that only one instance of [Dio] is created.
/// In debug mode, a [PrettyDioLogger] is added to the [Dio] instance to log the requests and responses.
///
@Singleton()
class DioInstance {
  final Dio dio;
  DioInstance(this.dio);

  @factoryMethod
  static DioInstance initDio() {
    final dio = Dio(BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 30000),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90),
      );
    }
    return DioInstance(dio);
  }
}