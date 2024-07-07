import 'package:flutter_github_explorer/core/utils/link_parser.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/items_model.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/pagination_info.dart';

class SearchResponse {
  final ItemsModel model;
  final PaginationInfo paginationInfo;

  SearchResponse({
    required this.model,
    required this.paginationInfo,
  });

  factory SearchResponse.parse(Map<String, dynamic> body, String? linkHeader) {
    return SearchResponse(
      model: ItemsModel.fromJson(body),
      paginationInfo: linkHeader == null
          ? PaginationInfo()
          : PaginationInfo.fromJson(LinkParser.parseLinkHeader(linkHeader)),
    );
  }

  SearchResponse copyWithLoadMoreResponse(
      ItemsModel newModel, PaginationInfo paginationInfo) {
    return SearchResponse(
      model: model.addItems(newModel.items),
      paginationInfo: paginationInfo,
    );
  }
}
