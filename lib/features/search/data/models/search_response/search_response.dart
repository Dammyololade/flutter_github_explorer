import 'package:flutter_github_explorer/core/utils/link_parser.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/items_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/search_response_entity.dart';

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

  SearchResponseEntity toEntity() {
    return SearchResponseEntity(
      results: model.items.map((e) => e.toEntity()).toList(),
      paginationInfo: paginationInfo,
    );
  }

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      model: ItemsModel.fromJson(json['model']),
      paginationInfo: PaginationInfo.fromJson(json['paginationInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model': model.toJson(),
      'paginationInfo': paginationInfo.toJson(),
    };
  }
}
