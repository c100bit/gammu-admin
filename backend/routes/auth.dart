import 'package:backend/auth/handlers/auth_handler.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) {
  final handler = context.read<AuthHandler>();
  return handler(context.request);
}
