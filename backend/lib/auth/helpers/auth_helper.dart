import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../core/constants.dart';

final _originalToken = encryptAuth(
  login: const String.fromEnvironment('login', defaultValue: gammuLogin),
  password:
      const String.fromEnvironment('password', defaultValue: gammuPassword),
);

String? auth({required String login, required String password}) {
  final token = encryptAuth(login: login, password: password);
  return token == _originalToken ? token : null;
}

String encryptAuth({required String login, required String password}) {
  final bytes = utf8.encode('$login+$password');
  final digest = sha256.convert(bytes);
  return '$digest';
}

bool isValidToken(String token) => _originalToken == token;
