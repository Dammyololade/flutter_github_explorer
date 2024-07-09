
import 'package:flutter/material.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomePage()),
    );
    await tester.pumpAndSettle();
  }

  group("Homepage", () {
    testWidgets("should show HomePage", (tester) async {
      await pumpWidget(tester);

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets("should show HomePage with title", (tester) async {
      await pumpWidget(tester);

      expect(find.text("GitHub Explorer"), findsOneWidget);
    });

    testWidgets("should show HomePage with welcome message", (tester) async {
      await pumpWidget(tester);

      expect(find.text("Welcome to GitHub Explorer"), findsOneWidget);
    });

    testWidgets("should show HomePage with search button", (tester) async {
      await pumpWidget(tester);

      expect(find.text("Search for a repository"), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    });


  });
}