
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';

/// BaseUsecase abstract class
/// Contains a method to make an API call and return the result as an [ApiResultModel].
/// The [T] type parameter represents the type of the data returned by the API.
abstract class BaseUsecase<T> {
  Future<ApiResultModel<T>> call({required String url});
}