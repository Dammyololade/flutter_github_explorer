
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/core/utils/link_parser.dart';

import 'issue.dart';

class IssueResponse {
  final List<Issue> issues;
  final PaginationInfo paginationInfo;

  IssueResponse({
    required this.issues,
    required this.paginationInfo,
  });

  factory IssueResponse.parse(List<dynamic> issues, String? linkHeader) {
    return IssueResponse(
      issues: issues.map((e) => Issue.fromJson(e)).toList(),
      paginationInfo: linkHeader == null
          ? PaginationInfo()
          : PaginationInfo.fromJson(LinkParser.parseLinkHeader(linkHeader)),
    );
  }

  IssueResponse copyWithLoadMoreResponse(
      List<Issue> newIssues, PaginationInfo paginationInfo) {
    return IssueResponse(
      issues: [...issues, ...newIssues],
      paginationInfo: paginationInfo,
    );
  }
}