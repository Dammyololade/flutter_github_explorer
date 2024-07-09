
import 'package:equatable/equatable.dart';
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

  @override
  List<Object?> get props => [login, avatarUrl];

  @override
  String toString() => 'User(login: $login, avatarUrl: $avatarUrl)';
}