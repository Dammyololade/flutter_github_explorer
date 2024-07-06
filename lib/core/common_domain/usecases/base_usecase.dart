
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';

abstract class BaseUsecase<T> {
  Future<ApiResultModel<T>> call({required String url});
}