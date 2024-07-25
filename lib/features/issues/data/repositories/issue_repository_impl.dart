import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/models/error_result_model.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/local_datasource/issue_local_datasource.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/remote_datasource/issue_remote_datasource.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/issue_response_entity.dart';
import 'package:flutter_github_explorer/features/issues/domain/repositories/issue_repository.dart';
import 'package:injectable/injectable.dart';

/// A repository implementation to fetch issues from the GitHub API.
/// It uses the [IssueRemoteDatasource] to fetch issues from the API.
/// It uses the [IssueLocalDatasource] to cache the issues locally.
/// It returns an [ApiResultModel] with the data returned by the API or the error details.
@Injectable(as: IssueRepository)
class IssueRepositoryImpl implements IssueRepository {
  final IssueRemoteDatasource remoteDataSource;
  final IssueLocalDatasource localDataSource;

  IssueRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  /// Fetches the issues from the GitHub API using the provided [url].
  /// Returns an [ApiResultModel] with the data returned by the API or the error details.
  /// If the data is available in the local cache, it returns the cached data.
  @override
  Future<ApiResultModel<IssueResponseEntity>> getIssues({required String url}) async {
    try {
      final localData = await localDataSource.getIssues(url);
      if (localData != null) {
        return ApiResultModel.success(
          data: localData.toEntity(),
        );
      }

      final remoteData = await remoteDataSource.getIssues(url);
      return remoteData.when(
        onSuccess: (data) {
          localDataSource.cacheIssues(data, url);
          return ApiResultModel.success(
            data: data.toEntity(),
          );
        },
        onFailure: (error) => ApiResultModel.failure(error: error),
      );
    } catch (e) {
      return const ApiResultModel.failure(
        error: ErrorResultModel(message: "Unknown error occurred"),
      );
    }
  }
}
