// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String,
      fullName: json['full_name'] as String? ?? '',
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      isPrivate: json['private'] as bool,
      isFork: json['fork'] as bool,
      starGazersCount: (json['stargazers_count'] as num).toInt(),
      watchersCount: (json['watchers_count'] as num).toInt(),
      language: json['language'] as String? ?? '',
      forks: (json['forks'] as num).toInt(),
      openIssues: (json['open_issues'] as num?)?.toInt() ?? 0,
      defaultBranch: json['default_branch'] as String? ?? '',
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'description': instance.description,
      'private': instance.isPrivate,
      'fork': instance.isFork,
      'stargazers_count': instance.starGazersCount,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'forks': instance.forks,
      'open_issues': instance.openIssues,
      'default_branch': instance.defaultBranch,
    };
