import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/usecases/base_usecase.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/issue_response_entity.dart';
import 'package:flutter_github_explorer/features/issues/domain/repositories/issue_repository.dart';
import 'package:injectable/injectable.dart';

/// A usecase class to get the issues from the [IssueRepository].
/// It implements the [BaseUsecase] class.
/// It takes a [IssueRepository] as a parameter and returns an [ApiResultModel] with the [IssueResponse] data.
@injectable
class IssuesUsecase implements BaseUsecase<IssueResponseEntity> {
  final IssueRepository repository;

  IssuesUsecase({required this.repository});

  @override
  Future<ApiResultModel<IssueResponseEntity>> call({required String url}) {
    return repository.getIssues(url: url);
  }
}
