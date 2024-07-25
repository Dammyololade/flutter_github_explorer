import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/issue_response_entity.dart';

/// An abstract class representing the repository for the issues feature.
/// It contains a method to get the issues from the GitHub API.
abstract class IssueRepository {
  Future<ApiResultModel<IssueResponseEntity>> getIssues({required String url});
}
