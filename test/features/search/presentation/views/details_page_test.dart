import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/pagination_info.dart';
import 'package:flutter_github_explorer/core/di/app_locator.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_github_explorer/features/issues/domain/usecases/Issues_usecase.dart';
import 'package:flutter_github_explorer/features/issues/presentation/views/issue_result.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/item.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/item_entity.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/details_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/test_utis.dart';

void main() {
  late IssuesUsecase issuesUsecase;
  final ItemEntity item = Item.fromJson(TestUtis.singleItem).toEntity();

  setUpAll(() {
    HttpOverrides.global = null;
    TestWidgetsFlutterBinding.ensureInitialized();

    issuesUsecase = MockIssuesUsecase();
    when(() => issuesUsecase.call(url: any(named: "url"))).thenAnswer(
      (_) async => ApiResultModelSuccess(
        data: IssueResponse(
          issues: [],
          paginationInfo: PaginationInfo(),
        ).toEntity(),
      ),
    );

    locator.registerSingleton<IssuesUsecase>(issuesUsecase);
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DetailsPage(
          item: item,
        ),
      ),
    );
  }

  group("DetailsPage", () {
    testWidgets("should show DetailsPage", (tester) async {
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      expect(find.byType(DetailsPage), findsOneWidget);
    });

    testWidgets("should show DetailsPage with title", (tester) async {
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      expect(find.text(item.fullName), findsOneWidget);
    });

    testWidgets("should show DetailsPage with Hero widget", (tester) async {
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      expect(find.byType(Hero), findsOneWidget);
    });

    testWidgets("should show DetailsPage with IssueResult widget",
        (tester) async {
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      expect(find.byType(IssueResult), findsOneWidget);
    });
  });
}
