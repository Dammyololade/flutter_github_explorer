import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';

/// A contract class that defines the methods that must be implemented by
/// any data source that wants to provide search functionality.
/// This is a good example of the Interface Segregation Principle.
abstract class SearchRemoteDataSource {
  Future<ApiResultModel<Map<String, dynamic>>> search(String query);

  Future<ApiResultModel<Map<String, dynamic>>> next(String url);
}
