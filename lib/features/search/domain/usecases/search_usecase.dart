
import 'package:flutter_github_explorer/core/common_domain/models/api_result_model.dart';
import 'package:flutter_github_explorer/core/common_domain/usecases/base_usecase.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/search_response.dart';
import 'package:flutter_github_explorer/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUsecase implements BaseUsecase<SearchResponse> {

  SearchUsecase(this.searchRepository);

  final SearchRepository searchRepository;

  @override
  Future<ApiResultModel<SearchResponse>> call({required String url}) {
    return searchRepository.search(query: url);
  }

}