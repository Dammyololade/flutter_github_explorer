
/// This abstract class is used to define the local datasource methods.
/// The local datasource is responsible for caching and retrieving data from the local storage.
/// In this case, the local storage is a simple key-value store.
abstract class IssueLocalDatasource {
  /// This method is used to retrieve the issues from the local storage.
  Future<Map<String, dynamic>?> getIssues(String key);

  /// This method is used to cache the issues in the local storage.
  void cacheIssues(Map<String, dynamic> issues, String key);
}