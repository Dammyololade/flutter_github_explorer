
import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/item_entity.dart';

class SearchResponseEntity extends Equatable{
  final List<ItemEntity> results;
  final PaginationInfo paginationInfo;

  const SearchResponseEntity({
    required this.results,
    required this.paginationInfo,
  });

  @override
  List<Object?> get props => [results, paginationInfo];

  SearchResponseEntity copyWithLoadMoreResponse(
      List<ItemEntity> newItems, PaginationInfo paginationInfo) {
    return SearchResponseEntity(
      results: [...results, ...newItems],
      paginationInfo: paginationInfo,
    );
  }

  @override
  String toString() => 'SearchResponse(results: $results, paginationInfo: $paginationInfo)';
}