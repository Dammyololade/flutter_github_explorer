
import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/reactions_entity.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/user_entity.dart';

class IssueEntity extends Equatable {
  final String title;
  final String url;
  final String state;
  final bool locked;
  final int comments;
  final bool draft;
  final String body;
  final UserEntity user;
  final ReactionsEntity reactions;
  final DateTime createdAt;

  const IssueEntity({
    required this.title,
    required this.url,
    required this.state,
    required this.locked,
    required this.comments,
    required this.draft,
    required this.body,
    required this.user,
    required this.reactions,
    required this.createdAt,
  });

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
        createdAt,
        reactions
      ];

  @override
  String toString() {
    return 'Issue(title: $title, url: $url, state: $state, locked: $locked, comments: $comments, draft: $draft, body: $body, user: $user, reactions: $reactions, createdAt: $createdAt)';
  }
}