
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String login;
  final String avatarUrl;

  const UserEntity({
    required this.login,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [login, avatarUrl];

  @override
  String toString() => 'User(login: $login, avatarUrl: $avatarUrl)';
}