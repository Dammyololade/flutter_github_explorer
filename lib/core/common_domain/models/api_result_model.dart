import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';

abstract class ApiResultModel<T> extends Equatable {
  const ApiResultModel._();

  const factory ApiResultModel.success({required T data}) =
      ApiResultModelSuccess<T>;

  const factory ApiResultModel.failure({required ErrorResultModel error}) =
      ApiResultModelFailure<T>;

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
