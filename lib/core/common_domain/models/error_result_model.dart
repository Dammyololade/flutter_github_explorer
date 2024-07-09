import 'package:equatable/equatable.dart';

/// A model class to represent the error details returned by an API call.
/// It contains the status code and the error message.
class ErrorResultModel extends Equatable {
  const ErrorResultModel({
    this.statusCode,
    this.message,
  });

  final int? statusCode;
  final String? message;

  @override
  List<Object?> get props => <Object?>[
        statusCode,
        message,
      ];
}
