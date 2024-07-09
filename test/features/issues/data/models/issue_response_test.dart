import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("IssueResponse", () {
    test("copyWithLoadMoreResponse should return right instance", () {
      final IssueResponse issueResponse = IssueResponse(
        issues: [
          Issue.fromJson(const {
            "title": "title",
            "created_at": "2021-10-10T10:10:10Z",
            "user": {
              "login": "login",
              "avatar_url": "avatar_url",
            },
            "reactions": {
              "url": "url",
            }
          }),
        ],
        paginationInfo: PaginationInfo(),
      );
      final List<Issue> newIssues = [
        Issue.fromJson(const {
          "title": "Another title",
          "created_at": "2021-10-10T10:10:10Z",
          "user": {
            "login": "login",
            "avatar_url": "avatar_url",
          },
          "reactions": {
            "url": "url",
          }
        }),
      ];
      final PaginationInfo paginationInfo = PaginationInfo(
        first: "first",
        last: "last",
      );

      final IssueResponse result =
          issueResponse.copyWithLoadMoreResponse(newIssues, paginationInfo);

      expect(result, isA<IssueResponse>());
      expect(result.issues.length, 2);
      expect(result.paginationInfo.first, "first");
    });
  });
}
