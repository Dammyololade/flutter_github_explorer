import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/core/utils/app_constants.dart';
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/search_data_source.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchDataSource)
class SearchDataSourceImpl implements SearchDataSource {
  SearchDataSourceImpl(this._dioRequestWrapper);

  final DioRequestWrapper _dioRequestWrapper;

  @override
  Future<ApiResultModel<SearchResponse>> search(String query) async {
    try {
      final response = await _dioRequestWrapper.call(
        "${AppConstants.serverBaseUrl}?q=$query&per_page=20&sort=name&order=asc",
      );
      return response.when(
        onSuccess: (data) => ApiResultModelSuccess(
          data: SearchResponse.parse(
            data.data,
            data.headers.value("link")!,
          ),
        ),
        onFailure: (error) => ApiResultModelFailure(error: error),
      );
    } on Exception catch (e) {
      return ApiResultModelFailure(
        error: ErrorResultModel(
          statusCode: 0,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ApiResultModel<SearchResponse>> next(String url) async {
    try {
      final response = await _dioRequestWrapper.call(
        url,
      );
      return response.when(
        onSuccess: (data) => ApiResultModelSuccess(
          data: SearchResponse.parse(
            data.data,
            data.headers.value("link")!,
          ),
        ),
        onFailure: (error) => ApiResultModelFailure(error: error),
      );
    } on Exception catch (e) {
      return ApiResultModelFailure(
        error: ErrorResultModel(
          statusCode: 0,
          message: e.toString(),
        ),
      );
    }
  }
}
