import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';

abstract class IssueRepository<T> {
  Future<ApiResultModel<List<T>>> getIssues({required String url});
}
