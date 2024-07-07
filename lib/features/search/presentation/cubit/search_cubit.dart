import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.searchUsecase,
    required this.loadMoreUsecase,
  }) : super(SearchInitial());

  final SearchUsecase searchUsecase;
  final LoadMoreUsecase loadMoreUsecase;
  Timer? _debounce;

  Future<void> clear() async {
    emit(SearchCleared());
  }

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

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is! SearchLoaded) {
      return;
    }
    return _fetchData(currentState.searchQuery);
  }

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
