
import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/issue_response_entity.dart';

/// A class to represent the state of the issues screen.
/// It can be one of the following states:
/// - [IssueInitial]: Initial state.
/// - [IssueLoading]: Loading state.
/// - [IssueLoaded]: Loaded state with the issues data.
/// - [IssueError]: Error state with the error message.
/// The state is used to manage the UI of the issues screen.
abstract class IssueState extends Equatable {}

class IssueInitial extends IssueState {
  @override
  List<Object?> get props => [];
}

class IssueLoading extends IssueState {
  @override
  List<Object?> get props => [];
}

class IssueLoaded extends IssueState {
  final IssueResponseEntity data;

  IssueLoaded({required this.data});

  @override
  List<Object?> get props => [data];

  @override
  String toString() {
    return 'IssueLoaded (data: $data )';
  }
}

class IssueError extends IssueState {
  final String message;

  IssueError({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return 'IssueError { message: $message }';
  }
}