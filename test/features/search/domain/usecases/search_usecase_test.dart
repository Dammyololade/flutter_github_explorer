
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/items_model.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late SearchRepository searchRepository;
  late SearchUsecase searchUsecase;

  setUp(() {
    searchRepository = MockSearchRepository();
    searchUsecase = SearchUsecase(searchRepository);
  });

  group('SearchUsecase', () {
    test('should call search from repository', () async {
      const url = 'url';
      when(() => searchRepository.search(query: any(named: "query"))).thenAnswer(
        (_) async => ApiResultModelSuccess(
          data: SearchResponse(
            model: const ItemsModel(items: [], totalCount: 0),
            paginationInfo: PaginationInfo(),
          ),
        ),
      );

      final response = await searchUsecase.call(url: url);

      verify(() => searchRepository.search(query: any(named: "query")));
      expect(response, isA<ApiResultModelSuccess<SearchResponse>>());
    });
  });
}