
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/usecases/base_usecase.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/search_response_entity.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

/// A concrete implementation of [LoadMoreUsecase] contract that uses [SearchRepository] to fetch paginated data.
@injectable
class LoadMoreUsecase implements BaseUsecase<SearchResponseEntity> {

  LoadMoreUsecase(this.searchRepository);

  /// An instance of [SearchRepository] to be used by this usecase.
  final SearchRepository searchRepository;

  /// Fetches the next page of data from the search API.
  /// Expected parameter is the URL of the next page.
  /// Returns an [ApiResultModel] which can be either [ApiResultModelSuccess] or [ApiResultModelFailure].
  @override
  Future<ApiResultModel<SearchResponseEntity>> call({required String url}) {
    return searchRepository.next(url: url);
  }

}