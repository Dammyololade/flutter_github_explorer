import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/exp_search.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => SearchCubit(
          searchUsecase: MockSearchUsecase(),
          loadMoreUsecase: MockLoadMoreUsecase()),
      child: MaterialApp(
        home: Builder(builder: (context) {
          return const Scaffold(body: ExpSearch());
        }),
      ),
    ));
    await tester.pumpAndSettle();
  }

  group("ExpSearch", () {
    testWidgets("should show ExpSearch", (tester) async {
      await pumpWidget(tester);

      expect(find.byType(ExpSearch), findsOneWidget);
    });

    testWidgets("should show ExpSearch with search field", (tester) async {
      await pumpWidget(tester);

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets("should show ExpSearch with search field with hint text",
        (tester) async {
      await pumpWidget(tester);

      expect(find.text("Search for a repository"), findsOneWidget);
    });
  });
}
