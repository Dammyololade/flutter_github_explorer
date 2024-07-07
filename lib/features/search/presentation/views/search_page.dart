import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/core/di/app_locator.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/load_more_usecase.dart';
import 'package:flutter_github_explorer/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/exp_search.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchCubit searchCubit;

  @override
  void initState() {
    super.initState();
    searchCubit = SearchCubit(
      searchUsecase: locator<SearchUsecase>(),
      loadMoreUsecase: locator<LoadMoreUsecase>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => searchCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Repositories'),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            children: [ExpSearch(), Expanded(child: SearchResult())],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchCubit.close();
    super.dispose();
  }
}
