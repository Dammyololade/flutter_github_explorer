import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';

/// An abstract class representing the repository for the issues feature.
/// It contains a method to get the issues from the GitHub API.
abstract class IssueRepository {
  Future<ApiResultModel<IssueResponse>> getIssues({required String url});
}
