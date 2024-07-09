import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/local_datasource/issue_local_datasource.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/remote_datasource/issue_remote_datasource.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_github_explorer/features/issues/data/repositories/issue_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/test_utis.dart';

void main() {
  late IssueRepositoryImpl issueRepository;
  late IssueRemoteDatasource issueRemoteDatasource;
  late IssueLocalDatasource issueLocalDatasource;

  setUp(() {
    issueRemoteDatasource = MockIssueRemoteDatasource();
    issueLocalDatasource = MockIssueLocalDatasource();

    issueRepository = IssueRepositoryImpl(
      remoteDataSource: issueRemoteDatasource,
      localDataSource: issueLocalDatasource,
    );
  });

  group("IssueRepositoryImpl", () {
    test("should get issues from remote datasource", () async {
      when(() => issueLocalDatasource.getIssues(any()))
          .thenAnswer((_) async => null);

      when(() => issueRemoteDatasource.getIssues(any())).thenAnswer(
          (_) async => ApiResultModelSuccess<Map<String, dynamic>>(data: {
                "data": TestUtis.issueResponse,
                "link": TestUtis.sampleLink,
              }));

      final response = await issueRepository.getIssues(url: "url");
      verify(() => issueRemoteDatasource.getIssues("url"));
      verify(() => issueLocalDatasource.cacheIssues(any(), any())).called(1);
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<IssueResponse>;
      expect(parsedResponse.data.issues.isNotEmpty, true);
      expect(parsedResponse.data.paginationInfo, isNotNull);
    });

    test("should get issues from local datasource", () async {
      when(() => issueLocalDatasource.getIssues(any()))
          .thenAnswer((_) async => {
                "data": TestUtis.issueResponse,
                "link": TestUtis.sampleLink,
              });

      final response = await issueRepository.getIssues(url: "url");
      verify(() => issueLocalDatasource.getIssues("url"));
      verifyNever(() => issueRemoteDatasource.getIssues(any()));
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<IssueResponse>;
      expect(parsedResponse.data.issues.isNotEmpty, true);
      expect(parsedResponse.data.paginationInfo, isNotNull);
    });

    test("should return failure when remote datasource fails", () async {
      when(() => issueLocalDatasource.getIssues(any()))
          .thenAnswer((_) async => null);

      when(() => issueRemoteDatasource.getIssues(any())).thenAnswer((_) async =>
          const ApiResultModelFailure(
              error: ErrorResultModel(message: "error")));

      final response = await issueRepository.getIssues(url: "url");
      verify(() => issueRemoteDatasource.getIssues("url"));
      verifyNever(() => issueLocalDatasource.cacheIssues(any(), any()));
      expect(response, isA<ApiResultModelFailure>());
    });

    test("should catch unexpected errors", () async {
      when(() => issueLocalDatasource.getIssues(any()))
          .thenAnswer((_) async => {
        "data": {},
        "link": TestUtis.sampleLink,
      });

      final response = await issueRepository.getIssues(url: "url");
      expect(response, isA<ApiResultModelFailure>());
    });

  });
}
