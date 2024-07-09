
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/local_datasource/issue_local_datasource.dart';
import 'package:flutter_github_explorer/features/issues/data/datasource/remote_datasource/issue_remote_datasource.dart';
import 'package:flutter_github_explorer/features/issues/domain/repositories/issue_repository.dart';
import 'package:flutter_github_explorer/features/issues/domain/usecases/Issues_usecase.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_cubit.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/local_datasource/search_local_datasource.dart';
import 'package:flutter_github_explorer/features/search/data/datasource/remote_datasource/search__remote_datasource.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockIssueRemoteDatasource extends Mock implements IssueRemoteDatasource {}

class MockDioRequestWrapper extends Mock implements DioRequestWrapper {}

class MockIssueLocalDatasource extends Mock implements IssueLocalDatasource {}

class MockIssuesRepository extends Mock implements IssueRepository {}

class MockSearchRepository extends Mock implements SearchRepository {}

class MockIssuesUsecase extends Mock implements IssuesUsecase {}

class MockIssueCubit extends Mock implements IssueCubit {}

class MockSearchRemoteDataSource extends Mock implements SearchRemoteDataSource {}

class MockSearchLocalDatasource extends Mock implements SearchLocalDatasource {}

class MockSearchUsecase extends Mock implements SearchUsecase {}

class MockLoadMoreUsecase extends Mock implements LoadMoreUsecase {}

class MockSearchCubit extends Mock implements SearchCubit {}