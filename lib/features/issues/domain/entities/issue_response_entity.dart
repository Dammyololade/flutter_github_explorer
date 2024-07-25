
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/issue_entity.dart';

class IssueResponseEntity {
  final List<IssueEntity> issues;
  final PaginationInfo paginationInfo;

  IssueResponseEntity({
    required this.issues,
    required this.paginationInfo,
  });

  IssueResponseEntity copyWithLoadMoreResponse(
      List<IssueEntity> newIssues, PaginationInfo paginationInfo) {
    return IssueResponseEntity(
      issues: [...issues, ...newIssues],
      paginationInfo: paginationInfo,
    );
  }
}