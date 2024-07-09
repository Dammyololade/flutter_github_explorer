import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/remote_datasource/issue_remote_datasource.dart';
import 'package:injectable/injectable.dart';

/// A remote datasource implementation to fetch issues from the GitHub API.
/// It uses the [DioRequestWrapper] to make API calls.
/// It returns an [ApiResultModel] with the data returned by the API or the error details.
@Injectable(as: IssueRemoteDatasource)
class IssueRemoteDatasourceImpl implements IssueRemoteDatasource {
  IssueRemoteDatasourceImpl(this._dioRequestWrapper);

  final DioRequestWrapper _dioRequestWrapper;

  /// Fetches the issues from the GitHub API using the provided [key].
  /// Returns an [ApiResultModel] with the data returned by the API or the error details.
  @override
  Future<ApiResultModel<Map<String, dynamic>>> getIssues(String key) async {
    try {
      final response = await _dioRequestWrapper.call(
        key,
      );
      return response.when(
        onSuccess: (data) => ApiResultModelSuccess(data: {
          "data": data.data,
          "link": data.headers.value("link"),
        }),
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
