import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/search_response_entity.dart';

/// A contract class that defines the methods that must be implemented by
/// any repository that wants to provide search functionality.
abstract class SearchRepository {
  Future<ApiResultModel<SearchResponseEntity>> search({required String query});

  Future<ApiResultModel<SearchResponseEntity>> next({required String url});
}
