// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_github_explorer/core/utils/helpers/dio_instance.dart'
    as _i3;
import 'package:flutter_github_explorer/core/utils/helpers/dio_request_wrapper.dart'
    as _i4;
import 'package:flutter_github_explorer/features/search/data/datasource/search_data_source.dart'
    as _i5;
import 'package:flutter_github_explorer/features/search/data/datasource/search_data_source_impl.dart'
    as _i6;
import 'package:flutter_github_explorer/features/search/data/repositories/search_repository_impl.dart'
    as _i8;
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart'
    as _i7;
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart'
    as _i10;
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DioInstance>(() => _i3.DioInstance.initDio());
    gh.singleton<_i4.DioRequestWrapper>(
        () => _i4.DioRequestWrapper(dioInstance: gh<_i3.DioInstance>()));
    gh.factory<_i5.SearchDataSource>(
        () => _i6.SearchDataSourceImpl(gh<_i4.DioRequestWrapper>()));
    gh.factory<_i7.SearchRepository>(() =>
        _i8.SearchRepositoryImpl(searchDataSource: gh<_i5.SearchDataSource>()));
    gh.factory<_i9.SearchUsecase>(
        () => _i9.SearchUsecase(gh<_i7.SearchRepository>()));
    gh.factory<_i10.LoadMoreUsecase>(
        () => _i10.LoadMoreUsecase(gh<_i7.SearchRepository>()));
    return this;
  }
}
