
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';

/// [SearchLocalDatasource] is an abstract class that defines the methods to be implemented by the [SearchLocalDatasourceImpl] class.
/// It contains the following methods:
/// - [getSearchedData]: Fetches the searched data for a given key.
/// - [cacheSearchedData]: Caches the searched data for a given key.
/// This class is used to define the contract for the local datasource layer of the search feature.
/// The local datasource layer is responsible for caching and retrieving data from the local storage.
/// It is used to store the search results locally so that they can be accessed quickly without making a network call.
/// The local datasource layer is used to improve the performance of the app by reducing the number of network calls.
abstract class SearchLocalDatasource {
  /// Fetches the searched data for a given [key].
  Future<SearchResponse?> getSearchedData(String key);

  /// Caches the searched data for a given [key].
  void cacheSearchedData(SearchResponse response, String key);
}
