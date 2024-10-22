import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/core/utils/route_manager.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/item_entity.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_github_explorer/features/search/presentation/cubit/search_state.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';

/// A widget to display the search results.
/// It displays a loading indicator when the search is in progress.
/// It displays the search results when the search is successful.
/// It displays an error message when an error occurs during the search.
class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (ct, state) {
      return switch (state.runtimeType) {
        const (SearchLoading) =>
          const Center(child: CircularProgressIndicator()),
        const (SearchLoaded) =>
          SearchLoadedBuilder(state: state as SearchLoaded),
        const (SearchError) => SearchErrorBuilder(state: state as SearchError),
        _ => const SizedBox(),
      };
    });
  }
}

class SearchLoadedBuilder extends StatelessWidget {
  const SearchLoadedBuilder({super.key, required this.state});

  final SearchLoaded state;

  @override
  Widget build(BuildContext context) {
    return RefreshLoadmore(
      onRefresh: () async {
        await context.read<SearchCubit>().refresh();
      },
      onLoadmore: () async {
        await context.read<SearchCubit>().loadMore();
      },
      noMoreWidget: Text(
        state.data.results.isEmpty
            ? 'No result found, Kindly refine your search'
            : 'No more data, you are at the end',
        style: TextStyle(
          color: Theme.of(context).disabledColor,
        ),
      ),
      isLastPage: state.data.paginationInfo.next == null,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shrinkWrap: true,
          itemBuilder: (ct, index) =>
              SingleItemBuilder(item: state.data.results[index]),
          separatorBuilder: (_, __) => const SizedBox(
                height: 16,
              ),
          itemCount: state.data.results.length),
    );
  }
}

class SearchErrorBuilder extends StatelessWidget {
  const SearchErrorBuilder({super.key, required this.state});

  final SearchError state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.message),
    );
  }
}

class SingleItemBuilder extends StatelessWidget {
  const SingleItemBuilder({super.key, required this.item});

  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteManager.details,
          arguments: item,
        );
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Hero(
                tag: item.fullName,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(item.owner.avatarUrl),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.fullName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Stars: ${item.starGazersCount}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          'Forks: ${item.forks}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
