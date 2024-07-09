import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';

/// A class to represent the state of the search feature.
/// It can be in one of the following states:
/// - [SearchInitial]: The initial state when the search query is empty.
/// - [SearchCleared]: The state when the search query is cleared.
/// - [SearchLoading]: The state when the search is in progress.
/// - [SearchLoaded]: The state when the search is successful.
/// - [SearchError]: The state when an error occurs during the search.
/// The [SearchLoaded] state contains the search results and the search query.
abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchCleared extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {
  final SearchResponse data;
  final String searchQuery;

  SearchLoaded({required this.data, required this.searchQuery});

  @override
  List<Object?> get props => [data, searchQuery];

  @override
  String toString() {
    return 'SearchLoaded (searchQuery:$searchQuery data: $data )';
  }
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return 'SearchError { message: $message }';
  }
}
