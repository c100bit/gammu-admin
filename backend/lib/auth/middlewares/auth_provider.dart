import 'package:backend/auth/handlers/auth_handler.dart';
import 'package:dart_frog/dart_frog.dart';

AuthHandler? _authHandler;

final authProvider = provider<AuthHandler>(
  (_) => _authHandler ??= AuthHandler(),
);
