class TestUtis {
  static String sampleLink =
      "<https://api.github.com/repositories/31792824/issues?state=open&per_page=20&page=2>; rel=next, <https://api.github.com/repositories/31792824/issues?state=open&per_page=20&page=638>; rel=last";

  static final issueResponse = [
    {
      "url": "https://api.github.com/repos/flutter/flutter/issues/151404",
      "repository_url": "https://api.github.com/repos/flutter/flutter",
      "labels_url":
          "https://api.github.com/repos/flutter/flutter/issues/151404/labels{/name}",
      "comments_url":
          "https://api.github.com/repos/flutter/flutter/issues/151404/comments",
      "events_url":
          "https://api.github.com/repos/flutter/flutter/issues/151404/events",
      "html_url": "https://github.com/flutter/flutter/issues/151404",
      "id": 2395491638,
      "node_id": "I_kwDOAeUeuM6OyE02",
      "number": 151404,
      "title":
          "The font is set to italic and the text extends beyond the text area",
      "user": {
        "login": "SpringSea28",
        "id": 15025940,
        "node_id": "MDQ6VXNlcjE1MDI1OTQw",
        "avatar_url": "https://avatars.githubusercontent.com/u/15025940?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/SpringSea28",
        "html_url": "https://github.com/SpringSea28",
        "followers_url": "https://api.github.com/users/SpringSea28/followers",
        "following_url":
            "https://api.github.com/users/SpringSea28/following{/other_user}",
        "gists_url": "https://api.github.com/users/SpringSea28/gists{/gist_id}",
        "starred_url":
            "https://api.github.com/users/SpringSea28/starred{/owner}{/repo}",
        "subscriptions_url":
            "https://api.github.com/users/SpringSea28/subscriptions",
        "organizations_url": "https://api.github.com/users/SpringSea28/orgs",
        "repos_url": "https://api.github.com/users/SpringSea28/repos",
        "events_url":
            "https://api.github.com/users/SpringSea28/events{/privacy}",
        "received_events_url":
            "https://api.github.com/users/SpringSea28/received_events",
        "type": "User",
        "site_admin": false
      },
      "labels": [
        {
          "id": 284437560,
          "node_id": "MDU6TGFiZWwyODQ0Mzc1NjA=",
          "url":
              "https://api.github.com/repos/flutter/flutter/labels/framework",
          "name": "framework",
          "color": "207de5",
          "default": false,
          "description":
              "flutter/packages/flutter repository. See also f: labels."
        },
        {
          "id": 1930767526,
          "node_id": "MDU6TGFiZWwxOTMwNzY3NTI2",
          "url":
              "https://api.github.com/repos/flutter/flutter/labels/has%20reproducible%20steps",
          "name": "has reproducible steps",
          "color": "000000",
          "default": false,
          "description":
              "The issue has been confirmed reproducible and is ready to work on"
        },
        {
          "id": 5706368363,
          "node_id": "LA_kwDOAeUeuM8AAAABVCBFaw",
          "url":
              "https://api.github.com/repos/flutter/flutter/labels/team-framework",
          "name": "team-framework",
          "color": "198022",
          "default": false,
          "description": "Owned by Framework team"
        },
        {
          "id": 6765407139,
          "node_id": "LA_kwDOAeUeuM8AAAABkz_row",
          "url":
              "https://api.github.com/repos/flutter/flutter/labels/found%20in%20release:%203.22",
          "name": "found in release: 3.22",
          "color": "fef2c0",
          "default": false,
          "description": "Found to occur in 3.22"
        },
        {
          "id": 6992397242,
          "node_id": "LA_kwDOAeUeuM8AAAABoMeDug",
          "url":
              "https://api.github.com/repos/flutter/flutter/labels/found%20in%20release:%203.23",
          "name": "found in release: 3.23",
          "color": "fef2c0",
          "default": false,
          "description": "Found to occur in 3.23"
        }
      ],
      "state": "open",
      "locked": false,
      "assignee": null,
      "assignees": [],
      "milestone": null,
      "comments": 2,
      "created_at": "2024-07-08T12:22:51Z",
      "updated_at": "2024-07-08T13:37:41Z",
      "closed_at": null,
      "author_association": "NONE",
      "active_lock_reason": null,
      "body":
          "### Steps to reproduce\n\n1、add a Container ,set color red\r\n2、add a Text in Contaniner\r\n3、set the  fontStyle FontStyle.italic\n\n### Expected results\n\nContainer  contain all the text.\r\nand i want to know the italic text with include the out part.\n\n### Actual results\n\npart of text is out of container\n\n### Code sample\n\n<details open><summary>Code sample</summary>\r\n\r\n```dart\r\nimport 'dart:developer';\r\n\r\nimport 'package:flutter/material.dart';\r\nimport 'package:flutter/rendering.dart';\r\n\r\nvoid main() {\r\n  debugPaintSizeEnabled = true;\r\n  runApp(const MaterialApp(home: MyApp()));\r\n}\r\n\r\nclass MyApp extends StatefulWidget {\r\n  const MyApp({super.key});\r\n\r\n  @override\r\n  State<MyApp> createState() => _MyAppState();\r\n}\r\n\r\nclass _MyAppState extends State<MyApp> {\r\n  String text = 'Text';\r\n\r\n  @override\r\n  Widget build(BuildContext context) {\r\n    const textStyleNormal = TextStyle(\r\n      inherit: true,\r\n      color: Color(0xff000000),\r\n      fontSize: 378.0,\r\n      height: 1.0,\r\n      fontStyle: FontStyle.normal,\r\n    );\r\n    final textSpanNormal = TextSpan(text: text, style: textStyleNormal);\r\n    final textPainterNormal = TextPainter(\r\n      text: textSpanNormal,\r\n      textDirection: TextDirection.ltr,\r\n      maxLines: 1,\r\n      textAlign: TextAlign.left,\r\n    );\r\n    textPainterNormal.layout(minWidth: 0, maxWidth: double.infinity);\r\n    var computeLineMetrics = textPainterNormal.computeLineMetrics();\r\n    for (var line in computeLineMetrics) {\r\n      log(\"normal line   }\r\n\r\n    const textStyleItalic = TextStyle(\r\n      inherit: true,\r\n      color: Color(0xff000000),\r\n      fontSize: 378.0,\r\n      height: 1.0,\r\n      fontStyle: FontStyle.italic,\r\n    );\r\n    final textSpanItalic = TextSpan(text: text, style: textStyleItalic);\r\n    final textPainterItalic = TextPainter(\r\n      text: textSpanItalic,\r\n      textDirection: TextDirection.ltr,\r\n      maxLines: 1,\r\n      textAlign: TextAlign.left,\r\n    );\r\n    textPainterItalic.layout(minWidth: 0, maxWidth: double.infinity);\r\n    var computeLineMetricsItalic = textPainterItalic.computeLineMetrics();\r\n    for (var line in computeLineMetricsItalic) {\r\n          body: Column(\r\n        children: [\r\n          Container(\r\n            color: Colors.red,\r\n            child: Text(text,style: textStyleNormal,),\r\n          ),\r\n          Container(\r\n            color: Colors.red,\r\n            child: Text(text,style: textStyleItalic,),\r\n          ),\r\n        ],\r\n      )\r\n    );\r\n  }\r\n}\r\n\r\n```\r\n\r\n</details>\r\n\n\n### Screenshots or Video\n\n<details open>\r\n<summary>Screenshots / Video demonstration</summary>\r\n\r\n[Upload media here]\r\n\r\n</details>\r\n\n\n### Logs\n\n<details open><summary>Logs</summary>\r\n\r\n```console\r\n[Paste your logs here]\r\n```\r\n\r\n</details>\r\n\n\n### Flutter Doctor output\n\n<details open><summary>Doctor output</summary>\r\n\r\n```console\r\n flutter doctor -v\r\nFlutter assets will be downloaded from https://storage.flutter-io.cn. Make sure you trust this source!\r\n[√] Flutter (Channel stable, 3.22.1, on Microsoft Windows [版本 10.0.19045.4529], locale zh-CN)\r\n    • Flutter version 3.22.1 on channel stable at E:\\flutter\\sdk\\flutter3.22.1\\flutter\r\n    • Upstream repository https://github.com/flutter/flutter.git                      \r\n    • Framework revision a14f74ff3a (7 weeks ago), 2024-05-22 11:08:21 -0500          \r\n    • Engine revision 55eae6864b                                                      \r\n    • Dart version 3.4.1                                                              \r\n    • DevTools version 2.34.3                                                         \r\n    • Pub download mirror https://pub.flutter-io.cn\r\n    • Flutter download mirror https://storage.flutter-io.cn\r\n\r\n[√] Windows Version (Installed version of Windows is version 10 or higher)\r\n\r\n[X] Android toolchain - develop for Android devices\r\n    X Unable to locate Android SDK.\r\n      Install Android Studio from: https://developer.android.com/studio/index.html\r\n      On first launch it will assist you in installing the Android SDK components.\r\n      (or visit https://flutter.dev/docs/get-started/install/windows#android-setup for detailed instructions).\r\n      If the Android SDK has been installed to a custom location, please use\r\n      `flutter config --android-sdk` to update to that location.\r\n\r\n\r\n[√] Chrome - develop for the web\r\n    • Chrome at C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe\r\n\r\n[√] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.10.0)\r\n    • Visual Studio at D:\\Program Files\\Microsoft Visual Studio\\2022\\Community\r\n    • Visual Studio Community 2022 version 17.10.34916.146\r\n    • Windows 10 SDK version 10.0.22621.0\r\n\r\n[√] Android Studio (version 2022.3)\r\n    • Android Studio at D:\\Program Files\\Android\\Android Studio20223121Giraffe\r\n    • Flutter plugin can be installed from:\r\n       https://plugins.jetbrains.com/plugin/9212-flutter\r\n    • Dart plugin can be installed from:\r\n       https://plugins.jetbrains.com/plugin/6351-dart\r\n    • Java version OpenJDK Runtime Environment (build 17.0.6+0-b2043.56-10027231)\r\n\r\n[√] Android Studio (version 2023.3)\r\n    • Android Studio at D:\\Program Files\\Android\\Android Studio\r\n    • Flutter plugin can be installed from:\r\n       https://plugins.jetbrains.com/plugin/9212-flutter\r\n    • Dart plugin can be installed from:\r\n       https://plugins.jetbrains.com/plugin/6351-dart\r\n    • Java version OpenJDK Runtime Environment (build 17.0.10+0--11572160)\r\n\r\n[√] Connected device (3 available)\r\n    • Windows (desktop) • windows • windows-x64    • Microsoft Windows [版本 10.0.19045.4529]\r\n    • Chrome (web)      • chrome  • web-javascript • Google Chrome 126.0.6478.127\r\n    • Edge (web)        • edge    • web-javascript • Microsoft Edge 126.0.2592.87\r\n\r\n[√] Network resources\r\n    • All expected network resources are available.\r\n\r\n! Doctor found issues in 1 category.\r\n\r\n```\r\n\r\n</details>\r\n",
      "reactions": {
        "url":
            "https://api.github.com/repos/flutter/flutter/issues/151404/reactions",
        "total_count": 0,
        "+1": 0,
        "-1": 0,
        "laugh": 0,
        "hooray": 0,
        "confused": 0,
        "heart": 0,
        "rocket": 0,
        "eyes": 0
      },
      "timeline_url":
          "https://api.github.com/repos/flutter/flutter/issues/151404/timeline",
      "performed_via_github_app": null,
      "state_reason": null
    },
    {
      "url": "https://api.github.com/repos/flutter/flutter/issues/151403",
      "repository_url": "https://api.github.com/repos/flutter/flutter",
      "labels_url":
          "https://api.github.com/repos/flutter/flutter/issues/151403/labels{/name}",
      "comments_url":
          "https://api.github.com/repos/flutter/flutter/issues/151403/comments",
      "events_url":
          "https://api.github.com/repos/flutter/flutter/issues/151403/events",
      "html_url": "https://github.com/flutter/flutter/pull/151403",
      "id": 2395488982,
      "node_id": "PR_kwDOAeUeuM50r_7P",
      "number": 151403,
      "title": "[deps] Roll dart-lang/native packages",
      "user": {
        "login": "dcharkes",
        "id": 3601775,
        "node_id": "MDQ6VXNlcjM2MDE3NzU=",
        "avatar_url": "https://avatars.githubusercontent.com/u/3601775?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/dcharkes",
        "html_url": "https://github.com/dcharkes",
        "followers_url": "https://api.github.com/users/dcharkes/followers",
        "following_url":
            "https://api.github.com/users/dcharkes/following{/other_user}",
        "gists_url": "https://api.github.com/users/dcharkes/gists{/gist_id}",
        "starred_url":
            "https://api.github.com/users/dcharkes/starred{/owner}{/repo}",
        "subscriptions_url":
            "https://api.github.com/users/dcharkes/subscriptions",
        "organizations_url": "https://api.github.com/users/dcharkes/orgs",
        "repos_url": "https://api.github.com/users/dcharkes/repos",
        "events_url": "https://api.github.com/users/dcharkes/events{/privacy}",
        "received_events_url":
            "https://api.github.com/users/dcharkes/received_events",
        "type": "User",
        "site_admin": false
      },
      "labels": [
        {
          "id": 283480100,
          "node_id": "MDU6TGFiZWwyODM0ODAxMDA=",
          "url": "https://api.github.com/repos/flutter/flutter/labels/tool",
          "name": "tool",
          "color": "5319e7",
          "default": false,
          "description":
              "Affects the \"flutter\" command-line tool. See also t: labels."
        },
        {
          "id": 1264801140,
          "node_id": "MDU6TGFiZWwxMjY0ODAxMTQw",
          "url":
              "https://api.github.com/repos/flutter/flutter/labels/a:%20desktop",
          "name": "a: desktop",
          "color": "38d8c8",
          "default": false,
          "description": "Running on desktop"
        }
      ],
      "state": "open",
      "locked": false,
      "assignee": null,
      "assignees": [],
      "milestone": null,
      "comments": 0,
      "created_at": "2024-07-08T12:21:49Z",
      "updated_at": "2024-07-08T13:12:28Z",
      "closed_at": null,
      "author_association": "CONTRIBUTOR",
      "active_lock_reason": null,
      "draft": false,
      "pull_request": {
        "url": "https://api.github.com/repos/flutter/flutter/pulls/151403",
        "html_url": "https://github.com/flutter/flutter/pull/151403",
        "diff_url": "https://github.com/flutter/flutter/pull/151403.diff",
        "patch_url": "https://github.com/flutter/flutter/pull/151403.patch",
        "merged_at": null
      },
      "body":
          "Pass in the minimum iOS and MacOS version.\r\n\r\nRoll dart-lang/native deps.\r\n\r\nRelated issues:\r\n\r\n* https://github.com/flutter/flutter/issues/145104\r\n* Relevant discussion: https://github.com/flutter/flutter/pull/148504\r\n\r\n## Pre-launch Checklist\r\n\r\n- [x] I read the [Contributor Guide] and followed the process outlined there for submitting PRs.\r\n- [x] I read the [Tree Hygiene] wiki page, which explains my responsibilities.\r\n- [x] I read and followed the [Flutter Style Guide], including [Features we expect every widget to implement].\r\n- [x] I signed the [CLA].\r\n- [x] I listed at least one issue that this PR fixes in the description above.\r\n- [ ] I updated/added relevant documentation (doc comments with `///`).\r\n- [ ] I added new tests to check the change I am making, or this PR is [test-exempt].\r\n- [ ] I followed the [breaking change policy] and added [Data Driven Fixes] where supported.\r\n- [x] All existing and new tests are passing.\r\n\r\n<!-- Links -->\r\n[Contributor Guide]: https://github.com/flutter/flutter/blob/main/docs/contributing/Tree-hygiene.md#overview\r\n[Tree Hygiene]: https://github.com/flutter/flutter/blob/main/docs/contributing/Tree-hygiene.md\r\n[test-exempt]: https://github.com/flutter/flutter/blob/main/docs/contributing/Tree-hygiene.md#tests\r\n[Flutter Style Guide]: https://github.com/flutter/flutter/blob/main/docs/contributing/Style-guide-for-Flutter-repo.md\r\n[Features we expect every widget to implement]: https://github.com/flutter/flutter/blob/main/docs/contributing/Style-guide-for-Flutter-repo.md#features-we-expect-every-widget-to-implement\r\n[CLA]: https://cla.developers.google.com/\r\n[flutter/tests]: https://github.com/flutter/tests\r\n[breaking change policy]: https://github.com/flutter/flutter/blob/main/docs/contributing/Tree-hygiene.md#handling-breaking-changes\r\n[Discord]: https://github.com/flutter/flutter/blob/main/docs/contributing/Chat.md\r\n[Data Driven Fixes]: https://github.com/flutter/flutter/blob/main/docs/contributing/Data-driven-Fixes.md\r\n",
      "reactions": {
        "url":
            "https://api.github.com/repos/flutter/flutter/issues/151403/reactions",
        "total_count": 0,
        "+1": 0,
        "-1": 0,
        "laugh": 0,
        "hooray": 0,
        "confused": 0,
        "heart": 0,
        "rocket": 0,
        "eyes": 0
      },
      "timeline_url":
          "https://api.github.com/repos/flutter/flutter/issues/151403/timeline",
      "performed_via_github_app": null,
      "state_reason": null
    }
  ];

  static final singleItem = {
    "id": 300269271,
    "node_id": "MDEwOlJlcG9zaXRvcnkzMDAyNjkyNzE=",
    "name": "flutter-widgets",
    "full_name": "syncfusion/flutter-widgets",
    "private": false,
    "owner": {
      "login": "syncfusion",
      "id": 1699795,
      "type": "Organization",
      "avatar_url": "https://avatars.githubusercontent.com/u/13048367?v=4",
      "site_admin": false
    },
    "html_url": "https://github.com/syncfusion/flutter-widgets",
    "description":
        "Syncfusion Flutter widgets libraries include high quality UI widgets and file-format packages to help you create rich, high-quality applications for iOS, Android, and web from a single code base.",
    "fork": false,
    "url": "https://api.github.com/repos/syncfusion/flutter-widgets",
    "forks_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/forks",
    "keys_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/keys{/key_id}",
    "collaborators_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/collaborators{/collaborator}",
    "teams_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/teams",
    "hooks_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/hooks",
    "issue_events_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/issues/events{/number}",
    "events_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/events",
    "assignees_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/assignees{/user}",
    "branches_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/branches{/branch}",
    "tags_url": "https://api.github.com/repos/syncfusion/flutter-widgets/tags",
    "blobs_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/git/blobs{/sha}",
    "git_tags_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/git/tags{/sha}",
    "git_refs_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/git/refs{/sha}",
    "trees_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/git/trees{/sha}",
    "statuses_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/statuses/{sha}",
    "languages_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/languages",
    "stargazers_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/stargazers",
    "contributors_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/contributors",
    "subscribers_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/subscribers",
    "subscription_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/subscription",
    "commits_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/commits{/sha}",
    "git_commits_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/git/commits{/sha}",
    "comments_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/comments{/number}",
    "issue_comment_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/issues/comments{/number}",
    "contents_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/contents/{+path}",
    "compare_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/compare/{base}...{head}",
    "merges_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/merges",
    "archive_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/{archive_format}{/ref}",
    "downloads_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/downloads",
    "issues_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/issues{/number}",
    "pulls_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/pulls{/number}",
    "milestones_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/milestones{/number}",
    "notifications_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/notifications{?since,all,participating}",
    "labels_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/labels{/name}",
    "releases_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/releases{/id}",
    "deployments_url":
        "https://api.github.com/repos/syncfusion/flutter-widgets/deployments",
    "created_at": "2020-10-01T12:21:09Z",
    "updated_at": "2024-07-07T16:18:57Z",
    "pushed_at": "2024-06-26T06:12:19Z",
    "git_url": "git://github.com/syncfusion/flutter-widgets.git",
    "ssh_url": "git@github.com:syncfusion/flutter-widgets.git",
    "clone_url": "https://github.com/syncfusion/flutter-widgets.git",
    "svn_url": "https://github.com/syncfusion/flutter-widgets",
    "homepage": null,
    "size": 201960,
    "stargazers_count": 1479,
    "watchers_count": 1479,
    "language": "Dart",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "has_discussions": false,
    "forks_count": 701,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 97,
    "license": null,
    "allow_forking": true,
    "is_template": false,
    "web_commit_signoff_required": false,
    "topics": [],
    "visibility": "public",
    "forks": 701,
    "open_issues": 97,
    "watchers": 1479,
    "default_branch": "master",
    "score": 1.0
  };

  static final searchResponse = {
    "total_count": 711268,
    "incomplete_results": false,
    "items": [
      {
        "id": 300269271,
        "node_id": "MDEwOlJlcG9zaXRvcnkzMDAyNjkyNzE=",
        "name": "flutter-widgets",
        "full_name": "syncfusion/flutter-widgets",
        "private": false,
        "owner": {
          "login": "syncfusion",
          "id": 1699795,
          "type": "Organization",
          "avatar_url": "https://avatars.githubusercontent.com/u/13048367?v=4",
          "site_admin": false
        },
        "html_url": "https://github.com/syncfusion/flutter-widgets",
        "description":
            "Syncfusion Flutter widgets libraries include high quality UI widgets and file-format packages to help you create rich, high-quality applications for iOS, Android, and web from a single code base.",
        "fork": false,
        "url": "https://api.github.com/repos/syncfusion/flutter-widgets",
        "forks_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/forks",
        "keys_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/keys{/key_id}",
        "collaborators_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/collaborators{/collaborator}",
        "teams_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/teams",
        "hooks_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/hooks",
        "issue_events_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/issues/events{/number}",
        "events_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/events",
        "assignees_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/assignees{/user}",
        "branches_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/branches{/branch}",
        "tags_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/tags",
        "blobs_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/git/blobs{/sha}",
        "git_tags_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/git/tags{/sha}",
        "git_refs_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/git/refs{/sha}",
        "trees_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/git/trees{/sha}",
        "statuses_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/statuses/{sha}",
        "languages_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/languages",
        "stargazers_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/stargazers",
        "contributors_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/contributors",
        "subscribers_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/subscribers",
        "subscription_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/subscription",
        "commits_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/commits{/sha}",
        "git_commits_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/git/commits{/sha}",
        "comments_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/comments{/number}",
        "issue_comment_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/issues/comments{/number}",
        "contents_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/contents/{+path}",
        "compare_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/compare/{base}...{head}",
        "merges_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/merges",
        "archive_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/{archive_format}{/ref}",
        "downloads_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/downloads",
        "issues_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/issues{/number}",
        "pulls_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/pulls{/number}",
        "milestones_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/milestones{/number}",
        "notifications_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/notifications{?since,all,participating}",
        "labels_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/labels{/name}",
        "releases_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/releases{/id}",
        "deployments_url":
            "https://api.github.com/repos/syncfusion/flutter-widgets/deployments",
        "created_at": "2020-10-01T12:21:09Z",
        "updated_at": "2024-07-07T16:18:57Z",
        "pushed_at": "2024-06-26T06:12:19Z",
        "git_url": "git://github.com/syncfusion/flutter-widgets.git",
        "ssh_url": "git@github.com:syncfusion/flutter-widgets.git",
        "clone_url": "https://github.com/syncfusion/flutter-widgets.git",
        "svn_url": "https://github.com/syncfusion/flutter-widgets",
        "homepage": null,
        "size": 201960,
        "stargazers_count": 1479,
        "watchers_count": 1479,
        "language": "Dart",
        "has_issues": true,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": true,
        "has_pages": false,
        "has_discussions": false,
        "forks_count": 701,
        "mirror_url": null,
        "archived": false,
        "disabled": false,
        "open_issues_count": 97,
        "license": null,
        "allow_forking": true,
        "is_template": false,
        "web_commit_signoff_required": false,
        "topics": [],
        "visibility": "public",
        "forks": 701,
        "open_issues": 97,
        "watchers": 1479,
        "default_branch": "master",
        "score": 1.0
      },
      {
        "id": 171028752,
        "node_id": "MDEwOlJlcG9zaXRvcnkxNzEwMjg3NTI=",
        "name": "Flutter-UI-Kits",
        "full_name": "leo-elstin/Flutter-UI-Kits",
        "private": false,
        "owner": {
          "login": "leo-elstin",
          "id": 13048367,
          "node_id": "MDQ6VXNlcjEzMDQ4MzY3",
          "avatar_url": "https://avatars.githubusercontent.com/u/13048367?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/leo-elstin",
          "html_url": "https://github.com/leo-elstin",
          "followers_url": "https://api.github.com/users/leo-elstin/followers",
          "following_url":
              "https://api.github.com/users/leo-elstin/following{/other_user}",
          "gists_url":
              "https://api.github.com/users/leo-elstin/gists{/gist_id}",
          "starred_url":
              "https://api.github.com/users/leo-elstin/starred{/owner}{/repo}",
          "subscriptions_url":
              "https://api.github.com/users/leo-elstin/subscriptions",
          "organizations_url": "https://api.github.com/users/leo-elstin/orgs",
          "repos_url": "https://api.github.com/users/leo-elstin/repos",
          "events_url":
              "https://api.github.com/users/leo-elstin/events{/privacy}",
          "received_events_url":
              "https://api.github.com/users/leo-elstin/received_events",
          "type": "User",
          "site_admin": false
        },
        "html_url": "https://github.com/leo-elstin/Flutter-UI-Kits",
        "description": "Flutter UI Designs !! ",
        "fork": false,
        "url": "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits",
        "forks_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/forks",
        "keys_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/keys{/key_id}",
        "collaborators_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/collaborators{/collaborator}",
        "teams_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/teams",
        "hooks_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/hooks",
        "issue_events_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/issues/events{/number}",
        "events_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/events",
        "assignees_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/assignees{/user}",
        "branches_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/branches{/branch}",
        "tags_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/tags",
        "blobs_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/git/blobs{/sha}",
        "git_tags_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/git/tags{/sha}",
        "git_refs_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/git/refs{/sha}",
        "trees_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/git/trees{/sha}",
        "statuses_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/statuses/{sha}",
        "languages_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/languages",
        "stargazers_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/stargazers",
        "contributors_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/contributors",
        "subscribers_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/subscribers",
        "subscription_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/subscription",
        "commits_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/commits{/sha}",
        "git_commits_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/git/commits{/sha}",
        "comments_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/comments{/number}",
        "issue_comment_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/issues/comments{/number}",
        "contents_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/contents/{+path}",
        "compare_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/compare/{base}...{head}",
        "merges_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/merges",
        "archive_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/{archive_format}{/ref}",
        "downloads_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/downloads",
        "issues_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/issues{/number}",
        "pulls_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/pulls{/number}",
        "milestones_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/milestones{/number}",
        "notifications_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/notifications{?since,all,participating}",
        "labels_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/labels{/name}",
        "releases_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/releases{/id}",
        "deployments_url":
            "https://api.github.com/repos/leo-elstin/Flutter-UI-Kits/deployments",
        "created_at": "2019-02-16T17:05:19Z",
        "updated_at": "2024-07-06T01:59:45Z",
        "pushed_at": "2022-08-28T05:43:03Z",
        "git_url": "git://github.com/leo-elstin/Flutter-UI-Kits.git",
        "ssh_url": "git@github.com:leo-elstin/Flutter-UI-Kits.git",
        "clone_url": "https://github.com/leo-elstin/Flutter-UI-Kits.git",
        "svn_url": "https://github.com/leo-elstin/Flutter-UI-Kits",
        "homepage": "",
        "size": 4552,
        "stargazers_count": 1363,
        "watchers_count": 1363,
        "language": "Dart",
        "has_issues": true,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": true,
        "has_pages": false,
        "has_discussions": false,
        "forks_count": 415,
        "mirror_url": null,
        "archived": false,
        "disabled": false,
        "open_issues_count": 1,
        "license": null,
        "allow_forking": true,
        "is_template": false,
        "web_commit_signoff_required": false,
        "topics": [
          "flutter",
          "flutter-demo",
          "flutter-examples",
          "flutter-ui",
          "flutter-widget"
        ],
        "visibility": "public",
        "forks": 415,
        "open_issues": 1,
        "watchers": 1363,
        "default_branch": "master",
        "score": 1.0
      },
      {
        "id": 252347441,
        "node_id": "MDEwOlJlcG9zaXRvcnkyNTIzNDc0NDE=",
        "name": "flutter-do",
        "full_name": "LaoMengFlutter/flutter-do",
        "private": false,
        "owner": {
          "login": "LaoMengFlutter",
          "id": 11678085,
          "node_id": "MDQ6VXNlcjExNjc4MDg1",
          "avatar_url": "https://avatars.githubusercontent.com/u/11678085?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/LaoMengFlutter",
          "html_url": "https://github.com/LaoMengFlutter",
          "followers_url":
              "https://api.github.com/users/LaoMengFlutter/followers",
          "following_url":
              "https://api.github.com/users/LaoMengFlutter/following{/other_user}",
          "gists_url":
              "https://api.github.com/users/LaoMengFlutter/gists{/gist_id}",
          "starred_url":
              "https://api.github.com/users/LaoMengFlutter/starred{/owner}{/repo}",
          "subscriptions_url":
              "https://api.github.com/users/LaoMengFlutter/subscriptions",
          "organizations_url":
              "https://api.github.com/users/LaoMengFlutter/orgs",
          "repos_url": "https://api.github.com/users/LaoMengFlutter/repos",
          "events_url":
              "https://api.github.com/users/LaoMengFlutter/events{/privacy}",
          "received_events_url":
              "https://api.github.com/users/LaoMengFlutter/received_events",
          "type": "User",
          "site_admin": false
        },
        "html_url": "https://github.com/LaoMengFlutter/flutter-do",
        "description":
            "包含350多个组件用法、组件继承关系图、40多个 loading 组件，App升级、验证码、弹幕、音乐字幕 4个插件，一个小而全完整的App项目。",
        "fork": false,
        "url": "https://api.github.com/repos/LaoMengFlutter/flutter-do",
        "forks_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/forks",
        "keys_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/keys{/key_id}",
        "collaborators_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/collaborators{/collaborator}",
        "teams_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/teams",
        "hooks_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/hooks",
        "issue_events_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/issues/events{/number}",
        "events_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/events",
        "assignees_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/assignees{/user}",
        "branches_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/branches{/branch}",
        "tags_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/tags",
        "blobs_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/git/blobs{/sha}",
        "git_tags_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/git/tags{/sha}",
        "git_refs_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/git/refs{/sha}",
        "trees_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/git/trees{/sha}",
        "statuses_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/statuses/{sha}",
        "languages_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/languages",
        "stargazers_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/stargazers",
        "contributors_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/contributors",
        "subscribers_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/subscribers",
        "subscription_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/subscription",
        "commits_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/commits{/sha}",
        "git_commits_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/git/commits{/sha}",
        "comments_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/comments{/number}",
        "issue_comment_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/issues/comments{/number}",
        "contents_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/contents/{+path}",
        "compare_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/compare/{base}...{head}",
        "merges_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/merges",
        "archive_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/{archive_format}{/ref}",
        "downloads_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/downloads",
        "issues_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/issues{/number}",
        "pulls_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/pulls{/number}",
        "milestones_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/milestones{/number}",
        "notifications_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/notifications{?since,all,participating}",
        "labels_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/labels{/name}",
        "releases_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/releases{/id}",
        "deployments_url":
            "https://api.github.com/repos/LaoMengFlutter/flutter-do/deployments",
        "created_at": "2020-04-02T03:37:01Z",
        "updated_at": "2024-07-06T18:41:42Z",
        "pushed_at": "2023-03-31T10:24:24Z",
        "git_url": "git://github.com/LaoMengFlutter/flutter-do.git",
        "ssh_url": "git@github.com:LaoMengFlutter/flutter-do.git",
        "clone_url": "https://github.com/LaoMengFlutter/flutter-do.git",
        "svn_url": "https://github.com/LaoMengFlutter/flutter-do",
        "homepage": "http://laomengit.com/",
        "size": 71549,
        "stargazers_count": 2597,
        "watchers_count": 2597,
        "language": "Dart",
        "has_issues": true,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": true,
        "has_pages": false,
        "has_discussions": false,
        "forks_count": 537,
        "mirror_url": null,
        "archived": false,
        "disabled": false,
        "open_issues_count": 55,
        "license": {
          "key": "apache-2.0",
          "name": "Apache License 2.0",
          "spdx_id": "Apache-2.0",
          "url": "https://api.github.com/licenses/apache-2.0",
          "node_id": "MDc6TGljZW5zZTI="
        },
        "allow_forking": true,
        "is_template": false,
        "web_commit_signoff_required": false,
        "topics": [],
        "visibility": "public",
        "forks": 537,
        "open_issues": 55,
        "watchers": 2597,
        "default_branch": "master",
        "score": 1.0
      },
    ],
  };
}
