import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';

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
