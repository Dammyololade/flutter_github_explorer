
import 'package:flutter_github_explorer/core/database/local_database.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/local_datasource/issue_local_datasource.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue_response.dart';
import 'package:injectable/injectable.dart';

/// This class implements the [IssueLocalDatasource] interface.
/// It is responsible for caching and retrieving issues from the local storage.
@Injectable(as: IssueLocalDatasource)
class IssueLocalDatasourceImpl implements IssueLocalDatasource {

  IssueLocalDatasourceImpl({required this.localDatabase});

  /// The local database instance. It is used to cache and retrieve data from the local storage.
  final LocalDatabase localDatabase;

  @override
  void cacheIssues(IssueResponse issues, String key) {
    localDatabase.put(key: key, data: issues.toJson(), store: DBStore.issues);
  }

  @override
  Future<IssueResponse?> getIssues(String key)async {
    try {
      final data = await localDatabase.get(key: key, store: DBStore.issues);
      return data != null ? IssueResponse.fromJson(data) : null;
    } on Exception catch (_) {
      return null;
    }
  }

}