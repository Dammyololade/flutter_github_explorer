import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owner.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  final String name;
  @JsonKey(name: 'full_name', defaultValue: '')
  final String fullName;
  final Owner owner;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'private')
  final bool isPrivate;
  @JsonKey(name: 'fork')
  final bool isFork;
  @JsonKey(name: 'stargazers_count')
  final int starGazersCount;
  @JsonKey(name: 'watchers_count')
  final int watchersCount;
  @JsonKey(name: 'language', defaultValue: '')
  final String language;
  final int forks;
  @JsonKey(name: 'open_issues', defaultValue: 0)
  final int openIssues;
  @JsonKey(name: 'default_branch', defaultValue: '')
  final String defaultBranch;

  const Item({
    required this.name,
    required this.fullName,
    required this.owner,
    required this.description,
    required this.isPrivate,
    required this.isFork,
    required this.starGazersCount,
    required this.watchersCount,
    required this.language,
    required this.forks,
    required this.openIssues,
    required this.defaultBranch,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  String toString() {
    return 'Item(name: $name, fullName: $fullName, owner: $owner, description: $description, isPrivate: $isPrivate, isFork: $isFork, starGazersCount: $starGazersCount, watchersCount: $watchersCount, language: $language, forks: $forks, openIssues: $openIssues, defaultBranch: $defaultBranch)';
  }

  @override
  List<Object?> get props {
    return [
      name,
      fullName,
      owner,
      description,
      isPrivate,
      isFork,
      starGazersCount,
      watchersCount,
      language,
      forks,
      openIssues,
      defaultBranch,
    ];
  }
}
