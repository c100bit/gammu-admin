import 'package:dart_frog/dart_frog.dart';

import '../helpers/auth_helper.dart';

Handler tokenValidator(Handler handler) {
  late final Response response;
  return (context) async {
    final request = context.request;
    final params = request.url.queryParameters;
    if ('${request.url}'.startsWith('auth') ||
        (params.containsKey('token') && isValidToken(params['token']!))) {
      response = await handler(context);
    } else {
      response = Response.json(body: 'Invalid AuthToken');
    }
    return response;
  };
}
