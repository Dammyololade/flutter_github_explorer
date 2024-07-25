import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String login;
  final String avatarUrl;
  final String url;

  const OwnerEntity({
    required this.login,
    required this.avatarUrl,
    required this.url,
  });

  @override
  List<Object?> get props => [login, avatarUrl, url];

  @override
  String toString() => 'Owner(login: $login, avatarUrl: $avatarUrl, url: $url)';
}
