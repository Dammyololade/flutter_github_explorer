import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/search_data_source.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl
    implements SearchRepository {

  SearchRepositoryImpl({required this.searchDataSource});

  final SearchDataSource searchDataSource;


  @override
  Future<ApiResultModel<SearchResponse>> next({required String url}) {
    return searchDataSource.next(url);
  }

  @override
  Future<ApiResultModel<SearchResponse>> search({required String query}) {
    return searchDataSource.search(query);
  }
}
