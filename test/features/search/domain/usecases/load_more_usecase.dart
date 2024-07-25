import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/items_model.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late SearchRepository searchRepository;
  late LoadMoreUsecase loadMoreUsecase;

  setUp(() {
    searchRepository = MockSearchRepository();
    loadMoreUsecase = LoadMoreUsecase(searchRepository);
  });

  group('LoadMoreUsecase', () {
    test('should call next from repository', () async {
      const url = 'url';
      when(() => searchRepository.next(url: any(named: "url"))).thenAnswer(
        (_) async => ApiResultModelSuccess(
          data: SearchResponse(
            model: const ItemsModel(items: [], totalCount: 0),
            paginationInfo: PaginationInfo(),
          ).toEntity(),
        ),
      );

      final response = await loadMoreUsecase.call(url: url);

      verify(() => searchRepository.next(url: any(named: "url")));
      expect(response, isA<ApiResultModelSuccess<SearchResponse>>());
    });
  });
}
