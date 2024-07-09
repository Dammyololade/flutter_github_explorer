import 'package:flutter_github_explorer/core/database/local_database.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/local_datasource/search_local_datasource.dart';
import 'package:injectable/injectable.dart';

/// [SearchLocalDatasourceImpl] is a class that implements the [SearchLocalDatasource] abstract class.
/// It is responsible for caching and retrieving the searched data from the local storage.
/// It uses the [LocalDatabase] to store and retrieve the data.
/// The [cacheSearchedData] method is used to cache the searched data for a given key.
/// The [getSearchedData] method is used to fetch the searched data for a given key.
/// This class is used to implement the local datasource layer of the search feature.
@Injectable(as: SearchLocalDatasource)
class SearchLocalDatasourceImpl implements SearchLocalDatasource {
  SearchLocalDatasourceImpl({required this.localDatabase});

  final LocalDatabase localDatabase;

  @override
  void cacheSearchedData(Map<String, dynamic> searchResponse, String key) {
    localDatabase.put(key: key, data: searchResponse, store: DBStore.search);
  }

  @override
  Future<Map<String, dynamic>?> getSearchedData(String key) {
    return localDatabase.get(key: key, store: DBStore.search);
  }
}
