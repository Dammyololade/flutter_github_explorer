import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';

/// A remote datasource to fetch issues from the GitHub API.
abstract class IssueRemoteDatasource {
  Future<ApiResultModel<IssueResponse>> getIssues(String key);
}
