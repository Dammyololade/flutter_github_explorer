import 'package:dio/dio.dart';
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/core/utils/helpers/dio_instance.dart';
import 'package:injectable/injectable.dart';

/// Wrapper class for Dio request
/// This class is used to handle Dio request and return the result in a structured way
/// It returns [ApiResultModel] which contains the response data or error
/// The error is returned as [ErrorResultModel] which contains the status code and message
/// The error message is generated based on the error type and the response message from the server if available
@Singleton()
class DioRequestWrapper {
  final DioInstance dioInstance;

  DioRequestWrapper({required this.dioInstance});

  /// Method to make a GET request
  /// It returns [ApiResultModel] which contains the response data or error
  /// The [url] parameter is the endpoint to make the request
  Future<ApiResultModel<Response>> call(String url) async {
    try {
      final response = await dioInstance.dio.get(url);
      return ApiResultModel.success(data: response);
    } catch (e) {
      final error = _getError(e);
      return ApiResultModel.failure(
        error: ErrorResultModel(
          statusCode: error.$1,
          message: error.$2,
        ),
      );
    }
  }

  /// Method to handle the error and return the status code and message
  /// The error message is generated based on the error type and the response message from the server if available
  (int, String) _getError(dynamic e) {
    String msg = "";
    if (e is DioError) {
      msg = switch (e.type) {
        DioErrorType.cancel => "Request to API server was cancelled",
        DioErrorType.connectTimeout => "Connection timeout with API server",
        DioErrorType.other =>
          "Connection to API server failed due to internet connection",
        DioErrorType.receiveTimeout =>
          "Receive timeout in connection with API server",
        DioErrorType.response => e.response?.data?["message"] ??
            "An error occurred while communicating with the API server",
        DioErrorType.sendTimeout =>
          "Send timeout in connection with API server",
      };
    } else {
      msg = "An unexpected error occurred. Please try again later.";
    }
    return (e.response?.statusCode ?? 0, msg);
  }
}
