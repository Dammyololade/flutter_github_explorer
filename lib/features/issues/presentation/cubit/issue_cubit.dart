import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/core/utils/app_constants.dart';
import 'package:flutter_github_explorer/features/issues/domain/usecases/Issues_usecase.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_state.dart';

/// A cubit to manage the state of the issues screen.
/// It fetches the issues for a given repository name.
/// It also handles the pagination to load more issues.
/// It uses the [IssuesUsecase] to fetch the issues.
/// The state of the cubit can be one of the following:
/// - [IssueInitial]: Initial state.
/// - [IssueLoading]: Loading state.
/// - [IssueLoaded]: Loaded state with the issues data.
/// - [IssueError]: Error state with the error message.
/// The cubit provides the following methods:
/// - [getIssues]: Fetches the issues for a given repository name.
/// - [refresh]: Refreshes the issues data.
/// - [loadMore]: Loads more issues.
/// The cubit emits the following states:
/// - [IssueLoading]: When the issues are being fetched.
/// - [IssueLoaded]: When the issues are loaded successfully.
/// - [IssueError]: When an error occurs while fetching the issues.
class IssueCubit extends Cubit<IssueState> {
  IssueCubit({required this.issuesUsecase, IssueState? state})
      : super(state ?? IssueInitial());

  final IssuesUsecase issuesUsecase;

  /// Fetches the issues for a given repository [name]
  Future<void> getIssues(String name) async {
    emit(IssueLoading());
    return _fetchData(
        "${AppConstants.issuesBaseUrl}/$name/issues?state=open&per_page=20");
  }

  /// Refreshes the issues data.
  Future<void> refresh(String name) async {
    return _fetchData(
        "${AppConstants.issuesBaseUrl}/$name/issues?state=open&per_page=20");
  }

  /// Fetches the issues for a given [url]
  Future<void> _fetchData(String url) async {
    final result = await issuesUsecase.call(url: url);
    result.when(
      onSuccess: (data) {
        data.issues.sort(
            (a, b) => b.createdAt.toLocal().compareTo(a.createdAt.toLocal()));
        emit(IssueLoaded(data: data));
      },
      onFailure: (error) {
        emit(IssueError(message: error.message ?? "An error occurred"));
      },
    );
  }

  /// Loads more issues.
  /// It is used to load more issues when the user scrolls to the end of the list.
  /// It fetches the next page of issues and updates the state with the new issues data.
  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is! IssueLoaded) {
      return;
    }
    final nextPageUrl = currentState.data.paginationInfo.next;
    if (nextPageUrl == null) {
      return;
    }

    final result = await issuesUsecase.call(url: nextPageUrl);
    result.when(
      onSuccess: (data) {
        data.issues.sort(
            (a, b) => b.createdAt.toLocal().compareTo(a.createdAt.toLocal()));
        emit(IssueLoaded(
            data: currentState.data.copyWithLoadMoreResponse(
          data.issues,
          data.paginationInfo,
        )));
      },
      onFailure: (error) {
        emit(IssueError(message: error.message ?? "An error occurred"));
      },
    );
  }
}
