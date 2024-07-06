import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';

abstract class SearchRepository {
  Future<ApiResultModel<SearchResponse>> search({required String query});

  Future<ApiResultModel<SearchResponse>> next({required String url});
}
