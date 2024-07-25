import 'package:equatable/equatable.dart';

import 'owner_entity.dart';

class ItemEntity extends Equatable {
  final String name;
  final String fullName;
  final OwnerEntity owner;
  final String description;
  final bool isPrivate;
  final bool isFork;
  final int starGazersCount;
  final int watchersCount;
  final String language;
  final int forks;
  final int openIssues;
  final String defaultBranch;

  const ItemEntity({
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

  @override
  String toString() {
    return 'Item(name: $name, fullName: $fullName, owner: $owner, description: $description, isPrivate: $isPrivate, isFork: $isFork, starGazersCount: $starGazersCount, watchersCount: $watchersCount, language: $language, forks: $forks, openIssues: $openIssues, defaultBranch: $defaultBranch)';
  }
}
