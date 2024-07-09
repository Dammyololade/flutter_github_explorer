
import 'package:dio/dio.dart';
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/remote_datasource/search_remote_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';
import '../../../../../utils/test_utis.dart';

void main() {

  late SearchRemoteDataSourceImpl remoteDatasource;
  late DioRequestWrapper dioRequestWrapper;

  group("SearchRemoteDataSourceImpl", () {
    const searchQuery = "searchQuery";

    setUp(() {
      dioRequestWrapper = MockDioRequestWrapper();
      remoteDatasource = SearchRemoteDataSourceImpl(dioRequestWrapper);
    });

    test("should call dioRequestWrapper.call() with the searchQuery as the url", () async {

      when(() => dioRequestWrapper.call(any()))
          .thenAnswer((_) async => ApiResultModelSuccess<Response>(
          data: Response(
            requestOptions: RequestOptions(path: ""),
            statusCode: 200,
            headers: Headers.fromMap({
              "link": [TestUtis.sampleLink]
            }),
            data: TestUtis.searchResponse,
          )));

      final response = await remoteDatasource.search(searchQuery);
      verify(() => dioRequestWrapper.call(any())).called(1);
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<Map<String, dynamic>>;
      expect(parsedResponse.data["data"], isNotNull);
      expect(parsedResponse.data["link"], TestUtis.sampleLink);
    });

    test("should return ApiResultModelFailure if an exception is thrown", () async {
      when(() => dioRequestWrapper.call(any())).thenThrow(Exception());
      final response = await remoteDatasource.search(searchQuery);
      expect(response, isA<ApiResultModelFailure>());
    });

    test("should fetch next page successfully", () async {

      when(() => dioRequestWrapper.call(any()))
          .thenAnswer((_) async => ApiResultModelSuccess<Response>(
          data: Response(
            requestOptions: RequestOptions(path: ""),
            statusCode: 200,
            headers: Headers.fromMap({
              "link": [TestUtis.sampleLink]
            }),
            data: TestUtis.searchResponse,
          )));

      final response = await remoteDatasource.next("url");
      verify(() => dioRequestWrapper.call(any())).called(1);
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<Map<String, dynamic>>;
      expect(parsedResponse.data["data"], isNotNull);
      expect(parsedResponse.data["link"], TestUtis.sampleLink);
    });

    test("should return ApiResultModelFailure if an exception is thrown while fetching next page", () async {
      when(() => dioRequestWrapper.call(any())).thenThrow(Exception());
      final response = await remoteDatasource.next("url");
      expect(response, isA<ApiResultModelFailure>());
    });

  });
}