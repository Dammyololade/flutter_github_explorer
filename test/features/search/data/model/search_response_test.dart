import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/item.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/items_model.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/search_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("SearchResponse", () {
    test("copyWithLoadMoreResponse should return the correct data", () {
      final searchResult = SearchResponse(
        model: ItemsModel(totalCount: 2, items: [
          Item.fromJson(const {
            "name": "name",
            "full_name": "full_name",
            "owner": {"login": "login", "avatar_url": "avatar_url"},
            "description": "description",
            "private": false,
            "fork": false,
            "stargazers_count": 1,
            "watchers_count": 1,
            "language": "language",
            "forks": 1,
          })
        ]),
        paginationInfo: PaginationInfo(),
      ).toEntity();

      final newItems = [
        Item.fromJson(const {
          "name": "name",
          "full_name": "full_name",
          "owner": {"login": "login", "avatar_url": "avatar_url"},
          "description": "description",
          "private": false,
          "fork": false,
          "stargazers_count": 1,
          "watchers_count": 1,
          "language": "language",
          "forks": 1,
        }).toEntity()
      ];

      final paginationInfo = PaginationInfo(first: "first", last: "last");
      final result =
          searchResult.copyWithLoadMoreResponse(newItems, paginationInfo);

      expect(result, isA<SearchResponseEntity>());
      expect(result.results.length, 2);
      expect(result.paginationInfo.first, "first");
    });
  });
}
