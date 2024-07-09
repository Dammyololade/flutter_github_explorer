import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';

/// A generic class to represent the result of an API call.
/// It can be either a success or a failure.
/// If it is a success, it contains the data returned by the API.
/// If it is a failure, it contains an [ErrorResultModel] with the error details.
/// The [T] type parameter represents the type of the data returned by the API.
/// This class is used to decouple the API response from the UI layer.
/// The UI layer can handle the success and failure cases separately.
abstract class ApiResultModel<T> extends Equatable {
  const ApiResultModel._();

  const factory ApiResultModel.success({required T data}) =
      ApiResultModelSuccess<T>;

  const factory ApiResultModel.failure({required ErrorResultModel error}) =
      ApiResultModelFailure<T>;

  /// A helper method to handle the success and failure cases.
  /// It takes two functions as parameters:
  /// - [onSuccess]: a function that takes the data returned by the API and returns a value of type [W].
  /// - [onFailure]: a function that takes the error details and returns a value of type [W].
  W when<W>({
    required W Function(T data) onSuccess,
    required W Function(ErrorResultModel error) onFailure,
  }) {
    if (this is ApiResultModelSuccess) {
      return onSuccess((this as ApiResultModelSuccess<T>).data);
    } else {
      return onFailure((this as ApiResultModelFailure<T>).error);
    }
  }
}

class ApiResultModelSuccess<T> extends ApiResultModel<T> {
  final T data;

  const ApiResultModelSuccess({required this.data}) : super._();

  @override
  List<Object?> get props => [data];
}

class ApiResultModelFailure<T> extends ApiResultModel<T> {
  final ErrorResultModel error;

  const ApiResultModelFailure({required this.error}) : super._();

  @override
  List<Object?> get props => [error];
}
