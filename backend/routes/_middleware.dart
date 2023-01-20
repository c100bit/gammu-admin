import 'package:backend/auth/middlewares/auth_provider.dart';
import 'package:backend/auth/middlewares/token_validator.dart';
import 'package:backend/gammu/middlewares/gammu_provider.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

final cors = fromShelfMiddleware(corsHeaders());

Handler middleware(Handler handler) => handler
    .use(requestLogger())
    .use(cors)
    .use(tokenValidator)
    .use(authProvider)
    .use(gammuProvider);
