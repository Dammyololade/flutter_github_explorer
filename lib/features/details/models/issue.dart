
import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/details/models/reactions.dart';
import 'package:flutter_github_explorer/features/details/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue.g.dart';

@JsonSerializable()
class Issue extends Equatable {

  final String title;
  final String url;
  final String state;
  final bool locked;
  final int comments;
  final bool draft;
  final String body;
  final User user;
  final Reactions reactions;

  const Issue({
    required this.title,
    required this.url,
    required this.state,
    required this.locked,
    required this.comments,
    required this.draft,
    required this.body,
    required this.user,
    required this.reactions,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  @override
  List<Object?> get props =>
      [
        title,
        url,
        state,
        locked,
        comments,
        draft,
        body,
        user,
        reactions
      ];

  @override
  String toString() {
    return 'Issue(title: $title, url: $url, state: $state, locked: $locked, comments: $comments, draft: $draft, body: $body, user: $user, reactions: $reactions)';
  }

}