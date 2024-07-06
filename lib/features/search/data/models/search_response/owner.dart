import 'package:equatable/equatable.dart';
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

  @override
  List<Object?> get props => [login, avatarUrl, url];

  @override
  String toString() => 'Owner(login: $login, avatarUrl: $avatarUrl, url: $url)';
}