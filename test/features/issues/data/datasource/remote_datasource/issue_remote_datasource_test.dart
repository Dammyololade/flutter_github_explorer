import 'package:dio/dio.dart';
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/remote_datasource/issue_remote_datasource_impl.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';
import '../../../../../utils/test_utis.dart';

void main() {
  late IssueRemoteDatasourceImpl remoteDatasource;
  late DioRequestWrapper dioRequestWrapper;

  group("test getIssues()", () {
    const String key = "key";

    setUp(() {
      dioRequestWrapper = MockDioRequestWrapper();
      remoteDatasource = IssueRemoteDatasourceImpl(dioRequestWrapper);
    });

    test("should call dioRequestWrapper.call() with the key as the url",
        () async {

      when(() => dioRequestWrapper.call(any()))
          .thenAnswer((_) async => ApiResultModelSuccess<Response>(
                  data: Response(
                requestOptions: RequestOptions(path: ""),
                statusCode: 200,
                headers: Headers.fromMap({
                  "link": [TestUtis.sampleLink]
                }),
                data: TestUtis.issueResponse,
              )));

      final response = await remoteDatasource.getIssues(key);
      verify(() => dioRequestWrapper.call(any())).called(1);
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<IssueResponse>;
      expect(parsedResponse.data.issues, isNotEmpty);
      expect(parsedResponse.data.paginationInfo, isA<PaginationInfo>());
    });

    test("should return ApiResultModelFailure if an exception is thrown", () async {
      when(() => dioRequestWrapper.call(key)).thenThrow(Exception());
      final response = await remoteDatasource.getIssues(key);
      expect(response, isA<ApiResultModelFailure>());
    });

  });
}
