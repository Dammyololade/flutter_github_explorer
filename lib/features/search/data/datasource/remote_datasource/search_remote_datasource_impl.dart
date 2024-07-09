import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/core/utils/app_constants.dart';
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/remote_datasource/search__remote_datasource.dart';
import 'package:injectable/injectable.dart';

/// A concrete implementation of [SearchRemoteDataSource] contract that uses [DioRequestWrapper] to fetch data.
@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl(this._dioRequestWrapper);

  /// An instance of [DioRequestWrapper] that is used to make network requests.
  final DioRequestWrapper _dioRequestWrapper;

  /// Fetches search results from the server.
  /// returns [ApiResultModel<SearchResponse>] which can be either [ApiResultModelSuccess] or [ApiResultModelFailure].
  /// [ApiResultModelSuccess] contains the data returned from the server.
  /// [ApiResultModelFailure] contains the error that occurred while fetching data.
  /// It has a single parameter [query] which is the search query.
  /// This is used to search for repositories on Github.
  @override
  Future<ApiResultModel<Map<String, dynamic>>> search(String query) async {
    try {
      final response = await _dioRequestWrapper.call(
        "${AppConstants.serverBaseUrl}?q=$query&per_page=20",
      );
      return response.when(
        onSuccess: (data) => ApiResultModelSuccess(
          data: {
            "data": data.data,
            "link": data.headers.value("link"),
          },
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

  /// Fetches the next page of search results from the server.
  /// returns [ApiResultModel<SearchResponse>] which can be either [ApiResultModelSuccess] or [ApiResultModelFailure].
  /// It has a single parameter [url] which is the url of the next page of search results.
  /// [ApiResultModelSuccess] contains the data returned from the server.
  /// [ApiResultModelFailure] contains the error that occurred while fetching data.
  @override
  Future<ApiResultModel<Map<String, dynamic>>> next(String url) async {
    try {
      final response = await _dioRequestWrapper.call(
        url,
      );
      return response.when(
        onSuccess: (data) => ApiResultModelSuccess(
          data:  {
            "data": data.data,
            "link": data.headers.value("link"),
          },
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
