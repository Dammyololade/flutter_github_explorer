import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_github_explorer/features/issues/domain/repositories/issue_repository.dart';
import 'package:flutter_github_explorer/features/issues/domain/usecases/Issues_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late IssueRepository issuesRepository;
  late IssuesUsecase issueUseCase;

  setUp(() {
    issuesRepository = MockIssuesRepository();
    issueUseCase = IssuesUsecase(repository: issuesRepository);
  });

  group('IssuesUsecase', () {
    test('should call getIssues from repository', () async {
      const url = 'url';
      when(() => issuesRepository.getIssues(url: any(named: "url"))).thenAnswer(
        (_) async => ApiResultModelSuccess(
          data: IssueResponse(
            issues: [],
            paginationInfo: PaginationInfo(),
          ),
        ),
      );

      final response = await issueUseCase.call(url: url);

      verify(() => issuesRepository.getIssues(url: any(named: "url")));
      expect(response, isA<ApiResultModelSuccess<IssueResponse>>());
    });
  });
}
