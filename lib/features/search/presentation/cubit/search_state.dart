
import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';

abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {

  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {

  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {

  final SearchResponse data;

  SearchLoaded({required this.data});

  @override
  List<Object?> get props => [data];

  @override
  String toString() {
    return 'SearchLoaded { data: $data }';
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