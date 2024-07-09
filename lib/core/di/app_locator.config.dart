// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_github_explorer/core/database/local_database.dart'
    as _i3;
import 'package:flutter_github_explorer/core/di/app_module.dart' as _i21;
import 'package:flutter_github_explorer/core/utils/helpers/dio_instance.dart'
    as _i4;
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart'
    as _i5;
import 'package:flutter_github_explorer/features/issues/data/datasource/local_datasource/issue_local_datasource.dart'
    as _i10;
import 'package:flutter_github_explorer/features/issues/data/datasource/local_datasource/issue_local_datasource_impl.dart'
    as _i11;
import 'package:flutter_github_explorer/features/issues/data/datasource/remote_datasource/issue_remote_datasource.dart'
    as _i6;
import 'package:flutter_github_explorer/features/issues/data/datasource/remote_datasource/issue_remote_datasource_impl.dart'
    as _i7;
import 'package:flutter_github_explorer/features/issues/data/repositories/issue_repository_impl.dart'
    as _i15;
import 'package:flutter_github_explorer/features/issues/domain/repositories/issue_repository.dart'
    as _i14;
import 'package:flutter_github_explorer/features/issues/domain/usecases/Issues_usecase.dart'
    as _i16;
import 'package:flutter_github_explorer/features/search/data/datasource/local_datasource/search_local_datasource.dart'
    as _i12;
import 'package:flutter_github_explorer/features/search/data/datasource/local_datasource/search_local_datasource_impl.dart'
    as _i13;
import 'package:flutter_github_explorer/features/search/data/datasource/remote_datasource/search__remote_datasource.dart'
    as _i8;
import 'package:flutter_github_explorer/features/search/data/datasource/remote_datasource/search_remote_datasource_impl.dart'
    as _i9;
import 'package:flutter_github_explorer/features/search/data/repositories/search_repository_impl.dart'
    as _i18;
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart'
    as _i17;
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart'
    as _i20;
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart'
    as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.LocalDatabase>(
      () => appModule.database,
      preResolve: true,
    );
    gh.singleton<_i4.DioInstance>(() => _i4.DioInstance.initDio());
    gh.singleton<_i5.DioRequestWrapper>(
        () => _i5.DioRequestWrapper(dioInstance: gh<_i4.DioInstance>()));
    gh.factory<_i6.IssueRemoteDatasource>(
        () => _i7.IssueRemoteDatasourceImpl(gh<_i5.DioRequestWrapper>()));
    gh.factory<_i8.SearchRemoteDataSource>(
        () => _i9.SearchRemoteDataSourceImpl(gh<_i5.DioRequestWrapper>()));
    gh.factory<_i10.IssueLocalDatasource>(() =>
        _i11.IssueLocalDatasourceImpl(localDatabase: gh<_i3.LocalDatabase>()));
    gh.factory<_i12.SearchLocalDatasource>(() =>
        _i13.SearchLocalDatasourceImpl(localDatabase: gh<_i3.LocalDatabase>()));
    gh.factory<_i14.IssueRepository>(() => _i15.IssueRepositoryImpl(
          remoteDataSource: gh<_i6.IssueRemoteDatasource>(),
          localDataSource: gh<_i10.IssueLocalDatasource>(),
        ));
    gh.factory<_i16.IssuesUsecase>(
        () => _i16.IssuesUsecase(repository: gh<_i14.IssueRepository>()));
    gh.factory<_i17.SearchRepository>(() => _i18.SearchRepositoryImpl(
          remoteDataSource: gh<_i8.SearchRemoteDataSource>(),
          localDataSource: gh<_i12.SearchLocalDatasource>(),
        ));
    gh.factory<_i19.SearchUsecase>(
        () => _i19.SearchUsecase(gh<_i17.SearchRepository>()));
    gh.factory<_i20.LoadMoreUsecase>(
        () => _i20.LoadMoreUsecase(gh<_i17.SearchRepository>()));
    return this;
  }
}

class _$AppModule extends _i21.AppModule {}
