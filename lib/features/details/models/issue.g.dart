// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issue _$IssueFromJson(Map<String, dynamic> json) => Issue(
      title: json['title'] as String,
      url: json['url'] as String,
      state: json['state'] as String,
      locked: json['locked'] as bool,
      comments: (json['comments'] as num).toInt(),
      draft: json['draft'] as bool,
      body: json['body'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      reactions: Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'state': instance.state,
      'locked': instance.locked,
      'comments': instance.comments,
      'draft': instance.draft,
      'body': instance.body,
      'user': instance.user,
      'reactions': instance.reactions,
    };