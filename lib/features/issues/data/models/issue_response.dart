import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/core/utils/link_parser.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/issue_response_entity.dart';

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

  Map<String, dynamic> toJson() => {
        'issues': issues.map((e) => e.toJson()).toList(),
        'paginationInfo': paginationInfo.toJson(),
      };

  factory IssueResponse.fromJson(Map<String, dynamic> json) => IssueResponse(
        issues: List<Issue>.from(json['issues'].map((x) => Issue.fromJson(x))),
        paginationInfo: PaginationInfo.fromJson(json['paginationInfo']),
      );

  IssueResponseEntity toEntity() => IssueResponseEntity(
        issues: issues.map((e) => e.toEntity()).toList(),
        paginationInfo: paginationInfo,
      );
}
