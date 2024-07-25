import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:flutter_github_explorer/features/issues/domain/usecases/Issues_usecase.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_cubit.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/test_utis.dart';

void main() {
  late IssuesUsecase usecase;

  setUp(() {
    usecase = MockIssuesUsecase();
    when(() => usecase.call(url: any(named: "url"))).thenAnswer(
      (_) async => ApiResultModelSuccess(
        data: IssueResponse.parse(
          TestUtis.issueResponse,
          TestUtis.sampleLink,
        ).toEntity(),
      ),
    );
  });

  group("test IssueCubit", () {
    blocTest(
      "should fetch issues successfully",
      build: () => IssueCubit(issuesUsecase: usecase),
      act: (IssueCubit cubit) => cubit.getIssues("name"),
      expect: () => [
        isA<IssueLoading>(),
        isA<IssueLoaded>().having(
          (state) => state.data.issues.isNotEmpty,
          "issues is not empty",
          true,
        ),
      ],
      verify: (_) {
        verify(() => usecase.call(url: any(named: "url"))).called(1);
      },
    );

    blocTest(
      "should refresh successfully",
      build: () => IssueCubit(issuesUsecase: usecase),
      act: (IssueCubit cubit) => cubit.refresh("name"),
      expect: () => [
        isA<IssueLoaded>().having(
          (state) => state.data.issues.isNotEmpty,
          "issues is not empty",
          true,
        ),
      ],
      verify: (_) {
        verify(() => usecase.call(url: any(named: "url"))).called(1);
      },
    );

    blocTest(
      "should load more successfully",
      build: () => IssueCubit(
          issuesUsecase: usecase,
          state: IssueLoaded(
            data: IssueResponse.parse(
              TestUtis.issueResponse,
              TestUtis.sampleLink,
            ).toEntity(),
          )),
      act: (IssueCubit cubit) async {
        await cubit.loadMore();
      },
      expect: () => [
        isA<IssueLoaded>().having(
          (state) => state.data.issues.isNotEmpty,
          "issues is not empty",
          true,
        ),
      ],
      verify: (_) {
        verify(() => usecase.call(url: any(named: "url"))).called(1);
      },
    );

    blocTest(
      "should not load more when state is not IssueLoaded",
      build: () => IssueCubit(issuesUsecase: usecase),
      act: (IssueCubit cubit) async {
        await cubit.loadMore();
      },
      expect: () => [],
      verify: (_) {
        verifyNever(() => usecase.call(url: any(named: "url")));
      },
    );

    blocTest(
      "should not load more when next page url is null",
      build: () => IssueCubit(
          issuesUsecase: usecase,
          state: IssueLoaded(
            data: IssueResponse.parse(
              TestUtis.issueResponse,
              "",
            ).toEntity(),
          )),
      act: (IssueCubit cubit) async {
        await cubit.loadMore();
      },
      expect: () => [],
      verify: (_) {
        verifyNever(() => usecase.call(url: any(named: "url")));
      },
    );

    blocTest(
      "should emit error when usecase fails",
      build: () {
        when(() => usecase.call(url: any(named: "url"))).thenAnswer(
          (_) async => const ApiResultModelFailure(
            error: ErrorResultModel(message: "error"),
          ),
        );
        return IssueCubit(issuesUsecase: usecase);
      },
      act: (IssueCubit cubit) => cubit.getIssues("name"),
      expect: () => [
        isA<IssueLoading>(),
        isA<IssueError>().having(
          (state) => state.message,
          "message",
          "error",
        ),
      ],
      verify: (_) {
        verify(() => usecase.call(url: any(named: "url"))).called(1);
      },
    );
  });
}
