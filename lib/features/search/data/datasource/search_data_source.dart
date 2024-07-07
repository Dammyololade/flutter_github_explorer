
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';

/// A contract class that defines the methods that must be implemented by
/// any data source that wants to provide search functionality.
/// This is a good example of the Interface Segregation Principle.
abstract class SearchDataSource {
  Future<ApiResultModel<SearchResponse>> search(String query);

  Future<ApiResultModel<SearchResponse>> next(String url);
}