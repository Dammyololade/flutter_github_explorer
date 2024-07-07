import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/search_data_source.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

/// A concrete implementation of [SearchRepository] contract that uses [SearchDataSource] to fetch data.
/// One major advantage of using this approach is that the data source can be easily swapped out with another implementation
/// without affecting the repository or the usecase.
/// This is because the repository is the only class that knows about the data source
/// and the usecase is the only class that knows about the repository.
/// This is a good example of the Dependency Inversion Principle.
///
/// One major improvement for this class is to add implementation for local data source which will be used to cache data.
/// This will help to reduce the number of network calls and improve the performance of an app.
@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
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
