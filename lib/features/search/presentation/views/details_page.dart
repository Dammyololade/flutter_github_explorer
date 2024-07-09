import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_explorer/core/di/app_locator.dart';
import 'package:flutter_github_explorer/features/issues/domain/usecases/Issues_usecase.dart';
import 'package:flutter_github_explorer/features/issues/presentation/cubit/issue_cubit.dart';
import 'package:flutter_github_explorer/features/issues/presentation/views/issue_result.dart';
import 'package:flutter_github_explorer/features/search/data/models/search_response/item.dart';

/// A page to display the details of a repository.
/// It displays the repository name and the list of issues.
/// The list of issues is fetched from the GitHub API.
/// The [item] parameter is the repository to display.
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.item});

  final Item item;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late IssueCubit issueCubit;


  @override
  void initState() {
    issueCubit = IssueCubit(issuesUsecase: locator<IssuesUsecase>());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      issueCubit.getIssues(widget.item.fullName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.fullName),
        flexibleSpace: Hero(
          tag: widget.item.fullName,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.item.owner.avatarUrl),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (ct) => issueCubit,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Issues",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: IssueResult(
                  name: widget.item.fullName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
