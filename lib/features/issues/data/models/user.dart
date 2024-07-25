
import 'package:equatable/equatable.dart';
import 'package:flutter_github_explorer/features/issues/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String login;
  @JsonKey(name: 'avatar_url', defaultValue: '')
  final String avatarUrl;

  const User({
    required this.login,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserEntity toEntity() => UserEntity(
    login: login,
    avatarUrl: avatarUrl,
  );

  @override
  List<Object?> get props => [login, avatarUrl];

  @override
  String toString() => 'User(login: $login, avatarUrl: $avatarUrl)';
}