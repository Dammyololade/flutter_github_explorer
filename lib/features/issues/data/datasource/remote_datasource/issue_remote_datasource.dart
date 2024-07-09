import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';

/// A remote datasource to fetch issues from the GitHub API.
abstract class IssueRemoteDatasource {
  Future<ApiResultModel<Map<String, dynamic>>> getIssues(String key);
}
