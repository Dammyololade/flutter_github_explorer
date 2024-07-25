import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/owner_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable()
class Owner extends Equatable {

  @JsonKey(name: 'login', defaultValue: '')
  final String login;
  @JsonKey(name: 'avatar_url', defaultValue: '')
  final String avatarUrl;
  @JsonKey(name: 'url', defaultValue: '')
  final String url;

  Owner({
    required this.login,
    required this.avatarUrl,
    required this.url,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  OwnerEntity toEntity() {
    return OwnerEntity(
      login: login,
      avatarUrl: avatarUrl,
      url: url,
    );
  }

  @override
  List<Object?> get props => [login, avatarUrl, url];

  @override
  String toString() => 'Owner(login: $login, avatarUrl: $avatarUrl, url: $url)';
}