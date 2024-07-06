import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/utils/app_constants.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/issue_repository.dart';

class IssuesUsecase<T> {
  final IssueRepository<T> repository;

  IssuesUsecase({required this.repository});

  Future<ApiResultModel<List<T>>> getIssues({required String name}) async {
    return await repository.getIssues(
        url: "${AppConstants.issuesBaseUrl}$name");
  }
}
