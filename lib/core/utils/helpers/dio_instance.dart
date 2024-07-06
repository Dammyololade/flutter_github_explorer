
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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