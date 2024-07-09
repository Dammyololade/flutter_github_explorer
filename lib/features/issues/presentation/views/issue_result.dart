import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/features/issues/data/models/issue.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_cubit.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_state.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';

/// A widget to display the result of the issues screen.
/// It shows a loading indicator while the issues are being fetched.
/// It shows an error message if an error occurs while fetching the issues.
/// It shows the list of issues if the issues are loaded successfully.
/// It uses the [IssueCubit] to manage the state of the issues screen.
/// The [name] parameter is the name of the repository for which the issues are fetched.
class IssueResult extends StatelessWidget {
  const IssueResult(
      {super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueCubit, IssueState>(builder: (ct, state) {
      return switch (state.runtimeType) {
        const (IssueLoading) =>
          const Center(child: CircularProgressIndicator()),
        const (IssueError) => IssueErrorBuilder(error: state as IssueError),
        const (IssueLoaded) => IssuesLoadedBuilder(
            state: state as IssueLoaded,
            name: name,
          ),
        _ => const SizedBox(),
      };
    });
  }
}

class IssuesLoadedBuilder extends StatelessWidget {
  const IssuesLoadedBuilder(
      {super.key,
      required this.state,
      required this.name,});

  final IssueLoaded state;
  final String name;

  @override
  Widget build(BuildContext context) {
    return RefreshLoadmore(
      onRefresh: () async {
        await context.read<IssueCubit>().getIssues(name);
      },
      onLoadmore: () async {
        await context.read<IssueCubit>().loadMore();
      },
      noMoreWidget: Text(
        state.data.issues.isEmpty
            ? 'No issues found for this repository'
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
              SingleIssueBuilder(issue: state.data.issues[index]),
          separatorBuilder: (_, __) => const SizedBox(
                height: 16,
              ),
          itemCount: state.data.issues.length),
    );
  }
}

class IssueErrorBuilder extends StatelessWidget {
  const IssueErrorBuilder({super.key, required this.error});

  final IssueError error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error.message),
    );
  }
}

class SingleIssueBuilder extends StatelessWidget {
  const SingleIssueBuilder({super.key, required this.issue});

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(issue.user.avatarUrl),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  issue.title,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    issue.body,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.25,
                      color: Colors.white70,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Reactions
                Text(
                    "👍 ${issue.reactions.like} 👎 ${issue.reactions.dislike} 😄 ${issue.reactions.laugh} 😕 ${issue.reactions.confused} ❤️ ${issue.reactions.heart} 🚀 ${issue.reactions.rocket}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
