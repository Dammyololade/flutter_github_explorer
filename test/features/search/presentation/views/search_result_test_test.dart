import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/search_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';

import '../../../../mocks.dart';
import '../../../../utils/test_utis.dart';

void main() {
  late SearchCubit searchCubit;

  setUp(() {
    // prevents trying to load images over http
    HttpOverrides.global = null;
    TestWidgetsFlutterBinding.ensureInitialized();
    searchCubit = MockSearchCubit();
    when(() => searchCubit.close()).thenAnswer((_) async => {});
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: BlocProvider<SearchCubit>(
        create: (context) => searchCubit,
        child: Scaffold(
          body: Builder(builder: (context) {
            return const SearchResult();
          }),
        ),
      )),
    );
  }

  group("SearchCubit", () {
    testWidgets("show loading when state is loading", (tester) async {
      when(() => searchCubit.state).thenReturn(SearchLoading());
      when(() => searchCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([SearchLoading()]));
      await pumpWidget(tester);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets("show SearchErrorBuilder when state is error", (tester) async {
      final error = SearchError(message: "message");
      when(() => searchCubit.state).thenReturn(error);
      when(() => searchCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([error]));
      await pumpWidget(tester);

      expect(find.byType(SearchErrorBuilder), findsOneWidget);
      expect(find.text("message"), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets("show SearchLoadedBuilder when state is loaded",
        (tester) async {
      final loaded = SearchLoaded(
          data: SearchResponse.parse(
            TestUtis.searchResponse,
            TestUtis.sampleLink,
          ).toEntity(),
          searchQuery: 'names');
      when(() => searchCubit.state).thenReturn(loaded);
      when(() => searchCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([loaded]));
      await pumpWidget(tester);
      await tester.pumpAndSettle();

      expect(find.byType(RefreshLoadmore), findsOneWidget);
      expect(find.byType(SingleItemBuilder),
          findsNWidgets(loaded.data.results.length));
    });
  });
}
