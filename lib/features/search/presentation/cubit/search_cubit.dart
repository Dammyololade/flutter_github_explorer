import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchUsecase}) : super(SearchInitial());

  final SearchUsecase searchUsecase;

  Future<void> search(String query) async {
    emit(SearchLoading());
    final result = await searchUsecase.call(url: query);
    result.when(onSuccess: (data) {
      emit(SearchLoaded(data: data));
    }, onFailure: (error) {
      emit(SearchError(message: error.message ?? "An error occurred"));
    });
  }
}
