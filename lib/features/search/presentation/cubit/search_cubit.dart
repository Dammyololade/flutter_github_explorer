import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_state.dart';

/// A [Cubit] that manages the search state.
/// It uses the [SearchUsecase] to search for repositories based on a query.
/// It uses the [LoadMoreUsecase] to load more repositories when the user scrolls to the bottom of the list.
/// It debounces the search query to avoid making too many API calls.
/// It emits different states based on the search results.
/// The states are [SearchInitial], [SearchLoading], [SearchLoaded], [SearchError], and [SearchCleared].
/// The [SearchInitial] state is emitted when the search query is empty.
/// The [SearchLoading] state is emitted when the search is in progress.
/// The [SearchLoaded] state is emitted when the search is successful.
/// The [SearchError] state is emitted when an error occurs during the search.
/// The [SearchCleared] state is emitted when the search query is cleared.
class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.searchUsecase,
    required this.loadMoreUsecase,
    SearchState? initialState,
  }) : super(initialState ?? SearchInitial());

  final SearchUsecase searchUsecase;
  final LoadMoreUsecase loadMoreUsecase;
  Timer? _debounce;

  Future<void> clear() async {
    emit(SearchCleared());
  }

  /// Search for repositories based on the given query.
  /// It debounces the search query to avoid making too many API calls.
  /// Does nothing if the query is empty or less than 4 characters.
  Future<void> search(String query) async {
    if (query.isEmpty) {
      _debounce?.cancel();
      return clear();
    }

    if (query.length < 4) {
      return;
    }
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 700), () {
      emit(SearchLoading());
      _fetchData(query);
    });
  }

  /// Fetch the search results based on the given query.
  /// It emits the [SearchLoaded] state if the search is successful.
  /// It emits the [SearchError] state if an error occurs during the search.
  Future<void> _fetchData(String query) async {
    final result = await searchUsecase.call(url: query);
    if (state is SearchCleared) {
      return;
    }
    result.when(onSuccess: (data) {
      data.model.items.sort((a, b) =>
          a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()));
      emit(SearchLoaded(searchQuery: query, data: data));
    }, onFailure: (error) {
      emit(SearchError(message: error.message ?? "An error occurred"));
    });
  }

  /// Refresh the search results based on the current query.
  Future<void> refresh() async {
    final currentState = state;
    if (currentState is! SearchLoaded) {
      return;
    }
    return _fetchData(currentState.searchQuery);
  }

  /// Load more repositories based on the current search results.
  /// It emits the [SearchLoaded] state if the load more is successful.
  /// It emits the [SearchError] state if an error occurs during the load more.
  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is! SearchLoaded) {
      return;
    }
    final nextPageUrl = currentState.data.paginationInfo.next;
    if (nextPageUrl == null) {
      return;
    }
    final result = await loadMoreUsecase.call(url: nextPageUrl);
    result.when(onSuccess: (data) {
      data.model.items.sort((a, b) =>
          a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()));
      emit(SearchLoaded(
        searchQuery: currentState.searchQuery,
        data: currentState.data.copyWithLoadMoreResponse(
          data.model,
          data.paginationInfo,
        ),
      ));
    }, onFailure: (error) {
      emit(SearchError(message: error.message ?? "An error occurred"));
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
