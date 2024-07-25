import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/local_datasource/search_local_datasource.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/remote_datasource/search__remote_datasource.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/data/repositories/search_repository_impl.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/search_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/test_utis.dart';

void main() {
  late SearchRepositoryImpl searchRepository;
  late SearchRemoteDataSource searchRemoteDataSource;
  late SearchLocalDatasource searchLocalDatasource;

  setUp(() {
    registerFallbackValue(MockSearchResponse());
    searchRemoteDataSource = MockSearchRemoteDataSource();
    searchLocalDatasource = MockSearchLocalDatasource();

    searchRepository = SearchRepositoryImpl(
      remoteDataSource: searchRemoteDataSource,
      localDataSource: searchLocalDatasource,
    );
  });

  group("SearchRepositoryImpl", () {
    test("should get search results from remote datasource", () async {
      when(() => searchLocalDatasource.getSearchedData(any()))
          .thenAnswer((_) async => null);

      when(() => searchRemoteDataSource.search(any())).thenAnswer(
        (_) async => ApiResultModel.success(
          data: SearchResponse.parse(
            TestUtis.searchResponse,
            TestUtis.sampleLink,
          ),
        ),
      );

      final response = await searchRepository.search(query: "query");
      verify(() => searchRemoteDataSource.search("query"));
      verify(() => searchLocalDatasource.cacheSearchedData(any(), any()))
          .called(1);
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<SearchResponseEntity>;
      expect(parsedResponse.data.results.isNotEmpty, true);
      expect(parsedResponse.data.paginationInfo, isNotNull);
    });

    test("should get search results from local datasource", () async {
      when(() => searchLocalDatasource.getSearchedData(any()))
          .thenAnswer((_) async => SearchResponse.parse(
                TestUtis.searchResponse,
                TestUtis.sampleLink,
              ));

      final response = await searchRepository.search(query: "query");
      verify(() => searchLocalDatasource.getSearchedData("query"));
      verifyNever(() => searchRemoteDataSource.search(any()));
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<SearchResponseEntity>;
      expect(parsedResponse.data.results.isNotEmpty, true);
      expect(parsedResponse.data.paginationInfo, isNotNull);
    });

    test("should get next search results from remote datasource", () async {
      when(() => searchLocalDatasource.getSearchedData(any()))
          .thenAnswer((_) async => null);

      when(() => searchRemoteDataSource.next(any())).thenAnswer(
        (_) async => ApiResultModel.success(
          data: SearchResponse.parse(
            TestUtis.searchResponse,
            TestUtis.sampleLink,
          ),
        ),
      );

      final response = await searchRepository.next(url: "url");
      verify(() => searchRemoteDataSource.next("url"));
      verify(() => searchLocalDatasource.cacheSearchedData(any(), any()))
          .called(1);
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<SearchResponseEntity>;
      expect(parsedResponse.data.results.isNotEmpty, true);
      expect(parsedResponse.data.paginationInfo, isNotNull);
    });

    test("should get next search results from local datasource", () async {
      when(() => searchLocalDatasource.getSearchedData(any())).thenAnswer(
        (_) async => SearchResponse.parse(
          TestUtis.searchResponse,
          TestUtis.sampleLink,
        ),
      );

      final response = await searchRepository.next(url: "url");
      verify(() => searchLocalDatasource.getSearchedData("url"));
      verifyNever(() => searchRemoteDataSource.next(any()));
      expect(response, isA<ApiResultModelSuccess>());
      final parsedResponse = response as ApiResultModelSuccess<SearchResponseEntity>;
      expect(parsedResponse.data.results.isNotEmpty, true);
      expect(parsedResponse.data.paginationInfo, isNotNull);
    });

    test("should return failure when remote datasource fails", () async {
      when(() => searchLocalDatasource.getSearchedData(any()))
          .thenAnswer((_) async => null);

      when(() => searchRemoteDataSource.search(any())).thenAnswer((_) async =>
          const ApiResultModelFailure(
              error: ErrorResultModel(message: "error")));

      final response = await searchRepository.search(query: "query");
      verify(() => searchRemoteDataSource.search("query"));
      verifyNever(() => searchLocalDatasource.cacheSearchedData(any(), any()));
      expect(response, isA<ApiResultModelFailure>());
    });

    test("should return failure when remote datasource fails", () async {
      when(() => searchLocalDatasource.getSearchedData(any()))
          .thenAnswer((_) async => null);

      when(() => searchRemoteDataSource.next(any())).thenAnswer((_) async =>
          const ApiResultModelFailure(
              error: ErrorResultModel(message: "error")));

      final response = await searchRepository.next(url: "url");
      verify(() => searchRemoteDataSource.next("url"));
      verifyNever(() => searchLocalDatasource.cacheSearchedData(any(), any()));
      expect(response, isA<ApiResultModelFailure>());
    });

    test("should catch unexpected errors", () async {
      when(() => searchLocalDatasource.getSearchedData(any()))
          .thenThrow(Exception());

      final response = await searchRepository.search(query: "query");
      expect(response, isA<ApiResultModelFailure>());
    });
  });
}
