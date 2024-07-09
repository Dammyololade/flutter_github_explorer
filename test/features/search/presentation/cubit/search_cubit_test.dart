import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/test_utis.dart';

void main() {
  late SearchUsecase searchUsecase;
  late LoadMoreUsecase loadMoreUsecase;

  setUp(() {
    searchUsecase = MockSearchUsecase();
    loadMoreUsecase = MockLoadMoreUsecase();

    when(() => searchUsecase.call(url: any(named: "url"))).thenAnswer(
      (_) async => ApiResultModelSuccess(
        data:
            SearchResponse.parse(TestUtis.searchResponse, TestUtis.sampleLink),
      ),
    );
    when(() => loadMoreUsecase.call(url: any(named: "url"))).thenAnswer(
      (_) async => ApiResultModelSuccess(
        data:
            SearchResponse.parse(TestUtis.searchResponse, TestUtis.sampleLink),
      ),
    );
  });

  group("SearchCubit", () {
    blocTest(
      "should search data successfully",
      build: () => SearchCubit(
        searchUsecase: searchUsecase,
        loadMoreUsecase: loadMoreUsecase,
      ),
      act: (SearchCubit cubit) async {
        cubit.search("names");
        await Future.delayed(const Duration(milliseconds: 800));
      },
      expect: () => [
        isA<SearchLoading>(),
        isA<SearchLoaded>().having(
          (state) => state.data.model.items.isNotEmpty,
          "items is not empty",
          true,
        ),
      ],
      verify: (_) {
        verify(() => searchUsecase.call(url: any(named: "url"))).called(1);
      },
    );

    blocTest(
      "should load more data successfully",
      build: () => SearchCubit(
        searchUsecase: searchUsecase,
        loadMoreUsecase: loadMoreUsecase,
        initialState: SearchLoaded(
          searchQuery: "names",
          data: SearchResponse.parse(
            TestUtis.searchResponse,
            TestUtis.sampleLink,
          ),
        ),
      ),
      act: (SearchCubit cubit) => cubit.loadMore(),
      expect: () => [
        isA<SearchLoaded>().having(
          (state) => state.data.model.items.isNotEmpty,
          "items is not empty",
          true,
        ),
      ],
      verify: (_) {
        verify(() => loadMoreUsecase.call(url: any(named: "url"))).called(1);
      },
    );

    blocTest(
      "should refresh data successfully",
      build: () => SearchCubit(
        searchUsecase: searchUsecase,
        loadMoreUsecase: loadMoreUsecase,
        initialState: SearchLoaded(
          searchQuery: "names",
          data: SearchResponse.parse(
            TestUtis.searchResponse,
            TestUtis.sampleLink,
          ),
        ),
      ),
      act: (SearchCubit cubit) => cubit.refresh(),
      expect: () => [
        isA<SearchLoaded>().having(
          (state) => state.data.model.items.isNotEmpty,
          "items is not empty",
          true,
        ),
      ],
      verify: (_) {
        verify(() => searchUsecase.call(url: any(named: "url"))).called(1);
      },
    );

    blocTest(
      "should not search if query is empty",
      build: () => SearchCubit(
        searchUsecase: searchUsecase,
        loadMoreUsecase: loadMoreUsecase,
      ),
      act: (SearchCubit cubit) => cubit.search(""),
      expect: () => [
        isA<SearchCleared>(),
      ],
      verify: (_) {
        verifyNever(() => searchUsecase.call(url: any(named: "url")));
      },
    );

    blocTest(
      "should not search if query length is less than 4",
      build: () => SearchCubit(
        searchUsecase: searchUsecase,
        loadMoreUsecase: loadMoreUsecase,
      ),
      act: (SearchCubit cubit) => cubit.search("sea"),
      expect: () => [],
      verify: (_) {
        verifyNever(() => searchUsecase.call(url: any(named: "url")));
      },
    );

    blocTest(
      "should not refresh if state is not SearchLoaded",
      build: () => SearchCubit(
        searchUsecase: searchUsecase,
        loadMoreUsecase: loadMoreUsecase,
      ),
      act: (SearchCubit cubit) => cubit.refresh(),
      expect: () => [],
      verify: (_) {
        verifyNever(() => searchUsecase.call(url: any(named: "url")));
      },
    );

    blocTest(
      "should not load more if state is not SearchLoaded",
      build: () => SearchCubit(
        searchUsecase: searchUsecase,
        loadMoreUsecase: loadMoreUsecase,
      ),
      act: (SearchCubit cubit) => cubit.loadMore(),
      expect: () => [],
      verify: (_) {
        verifyNever(() => searchUsecase.call(url: any(named: "url")));
      },
    );
  });
}
