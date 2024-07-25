import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_cubit.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_state.dart';
import 'package:flutter_github_explorer/features/issues/presentation/views/issue_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/test_utis.dart';

void main() {
  late IssueCubit issueCubit;

  setUp(() {
    // prevents trying to load images over http
    HttpOverrides.global = null;
    WidgetsFlutterBinding.ensureInitialized();
    issueCubit = MockIssueCubit();
    when(() => issueCubit.close()).thenAnswer((_) async => {});
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: BlocProvider<IssueCubit>(
        create: (context) => issueCubit,
        child: Scaffold(
          body: Builder(builder: (context) {
            return const IssueResult(
              name: "name",
            );
          }),
        ),
      )),
    );
  }

  group("IssueCubit", () {
    testWidgets("show loading when state is loading", (tester) async {
      when(() => issueCubit.state).thenReturn(IssueLoading());
      when(() => issueCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([IssueLoading()]));
      await pumpWidget(tester);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets("show IssueErrorBuilder when state is error", (tester) async {
      final error = IssueError(message: "message");
      when(() => issueCubit.state).thenReturn(error);
      when(() => issueCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([error]));
      await pumpWidget(tester);

      expect(find.byType(IssueErrorBuilder), findsOneWidget);
      expect(find.text("message"), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets("show IssuesLoadedBuilder when state is loaded",
        (tester) async {
      final loaded = IssueLoaded(
          data: IssueResponse.parse(
        TestUtis.issueResponse,
        TestUtis.sampleLink,
      ).toEntity());
      when(() => issueCubit.state).thenReturn(loaded);
      when(() => issueCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([loaded]));
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      expect(find.byType(IssueErrorBuilder), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(IssuesLoadedBuilder), findsOneWidget);
      expect(find.byType(SingleIssueBuilder), findsExactly(2));
    });
  });
}
