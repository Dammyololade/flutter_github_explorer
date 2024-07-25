import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/issues/data/models/reactions.dart';
import 'package:flutter_github_explorer/features/issues/data/models/user.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/issue_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue.g.dart';

@JsonSerializable()
class Issue extends Equatable {
  final String title;
  @JsonKey(defaultValue: "")
  final String url;
  @JsonKey(defaultValue: "")
  final String state;
  @JsonKey(defaultValue: false)
  final bool locked;
  @JsonKey(defaultValue: 0)
  final int comments;
  @JsonKey(defaultValue: false)
  final bool draft;
  @JsonKey(defaultValue: "")
  final String body;
  final User user;
  final Reactions reactions;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

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
    required this.createdAt,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  Map<String, dynamic> toJson() => _$IssueToJson(this);

  IssueEntity toEntity() => IssueEntity(
        title: title,
        url: url,
        state: state,
        locked: locked,
        comments: comments,
        draft: draft,
        body: body,
        user: user.toEntity(),
        reactions: reactions.toEntity(),
        createdAt: createdAt,
      );

  @override
  List<Object?> get props => [
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
    return 'Issue(title: $title, url: $url, state: $state, locked: $locked, comments: $comments, draft: $draft, body: $body, user: $user, reactions: $reactions)';
  }
}
