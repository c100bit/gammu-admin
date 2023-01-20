import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthBody extends Equatable {
  const AuthBody({
    required this.login,
    required this.password,
  });

  factory AuthBody.fromJson(String source) =>
      AuthBody.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AuthBody.fromMap(Map<String, dynamic> map) {
    return AuthBody(
      login: map['login'] as String? ?? '',
      password: map['password'] as String? ?? '',
    );
  }

  final String login;
  final String password;

  @override
  String toString() => 'AuthBody(login: $login, password: $password)';

  @override
  List<Object?> get props => [login, password];
}
