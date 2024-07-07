
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/usecases/base_usecase.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

/// A concrete implementation of [SearchUsecase] contract that uses [SearchRepository] to fetch data.
/// One major advantage of using this approach is that the repository can be easily swapped out with another implementation
/// without affecting the usecase.
/// This is because the usecase is the only class that knows about the repository.
@injectable
class SearchUsecase implements BaseUsecase<SearchResponse> {

  SearchUsecase(this.searchRepository);

  final SearchRepository searchRepository;

  @override
  Future<ApiResultModel<SearchResponse>> call({required String url}) {
    return searchRepository.search(query: url);
  }

}