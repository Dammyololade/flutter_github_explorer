import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/local_datasource/search_local_datasource.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/remote_datasource/search__remote_datasource.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

/// A concrete implementation of the [SearchRepository] interface. It uses the [SearchRemoteDataSource] and [SearchLocalDatasource] to fetch the data.
/// It also caches the data in the local database to make it available offline.
/// This class is annotated with @Injectable to make it injectable using the get_it package.
/// The @Injectable annotation takes the 'as' parameter to specify the type of the interface that this class implements.
/// This is useful when you have multiple implementations of the same interface and you want to specify which implementation to use.
/// In this case, we have only one implementation of the [SearchRepository] interface, so we specify it using the as parameter.
/// The constructor takes two parameters: [remoteDataSource] and [localDataSource].
/// These parameters are injected automatically by the get_it package when an instance of this class is requested.
/// The [remoteDataSource] is used to fetch data from the remote API, while the [localDataSource] is used to cache the data in the local database.
@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  final SearchRemoteDataSource remoteDataSource;
  final SearchLocalDatasource localDataSource;

  /// A method to fetch the next page of search results.
  /// It takes a [url] parameter that contains the URL of the next page.
  /// It first checks if the data is available in the local database.
  /// If the data is available, it returns the cached data.
  /// If the data is not available, it fetches the data from the remote API and caches it in the local database.
  /// It returns an [ApiResultModel] with the search response data.
  @override
  Future<ApiResultModel<SearchResponse>> next({required String url}) async {
    try {
      final localData = await localDataSource.getSearchedData(url);
      if (localData != null) {
        return ApiResultModel.success(
            data: SearchResponse.parse(
          localData["data"],
          localData["link"],
        ));
      }
      final remoteData = await remoteDataSource.next(url);
      return remoteData.when(
          onSuccess: (data) {
            localDataSource.cacheSearchedData(data, url);
            return ApiResultModel.success(
                data: SearchResponse.parse(
              data["data"],
              data["link"],
            ));
          },
          onFailure: (error) => ApiResultModel.failure(error: error));
    } catch (e) {
      return const ApiResultModel.failure(
          error: ErrorResultModel(message: "Unknown error occurred"));
    }
  }

  /// A method to search for repositories based on a query string.
  /// It takes a [query] parameter that contains the search query.
  /// It first checks if the data is available in the local database.
  /// If the data is available, it returns the cached data.
  /// If the data is not available, it fetches the data from the remote API and caches it in the local database.
  @override
  Future<ApiResultModel<SearchResponse>> search({required String query}) async {
    try {
      final localData = await localDataSource.getSearchedData(query);
      if (localData != null) {
        return ApiResultModel.success(
            data: SearchResponse.parse(
          localData["data"],
          localData["link"],
        ));
      }
      final remoteData = await remoteDataSource.search(query);
      return remoteData.when(
          onSuccess: (data) {
            localDataSource.cacheSearchedData(data, query);
            return ApiResultModel.success(
                data: SearchResponse.parse(
              data["data"],
              data["link"],
            ));
          },
          onFailure: (error) => ApiResultModel.failure(error: error));
    } catch (e) {
      return const ApiResultModel.failure(
          error: ErrorResultModel(message: "Unknown error occurred"));
    }
  }
}
