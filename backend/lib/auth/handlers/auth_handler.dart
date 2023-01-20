import 'package:dart_frog/dart_frog.dart';

import '../entities/auth_body.dart';
import '../helpers/auth_helper.dart';

class AuthHandler {
  Future<Response> call(Request request) async {
    if (request.method != HttpMethod.post) return Response();

    final jsonData = await request.body();
    final body = AuthBody.fromJson(jsonData);
    final token = auth(login: body.login, password: body.password);
    return Response.json(body: {'token': token});
  }
}
