import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_github_explorer/core/di/app_locator.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/exp_search.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/search_page.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/search_result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  late SearchUsecase searchUsecase;
  late LoadMoreUsecase loadMoreUsecase;

  setUpAll(() {
    HttpOverrides.global = null;
    TestWidgetsFlutterBinding.ensureInitialized();

    searchUsecase = MockSearchUsecase();
    loadMoreUsecase = MockLoadMoreUsecase();

    locator.registerSingleton<SearchUsecase>(searchUsecase);
    locator.registerSingleton<LoadMoreUsecase>(loadMoreUsecase);
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SearchPage()),
    );
  }

  group("SearchPage", () {
    testWidgets("should show SearchPage", (tester) async {
      await pumpWidget(tester);

      expect(find.byType(SearchPage), findsOneWidget);
    });

    testWidgets("should show SearchPage with title", (tester) async {
      await pumpWidget(tester);

      expect(find.text("Search Repositories"), findsOneWidget);
    });

    testWidgets("should show SearchPage with ExpSearch widget", (tester) async {
      await pumpWidget(tester);

      expect(find.byType(ExpSearch), findsOneWidget);
    });

    testWidgets("should show SearchPage with SearchResult widget",
        (tester) async {
      await pumpWidget(tester);

      expect(find.byType(SearchResult), findsOneWidget);
    });
  });
}
