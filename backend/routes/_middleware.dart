import 'package:backend/gammu/provider/gammu_provider.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) =>
    handler..use(requestLogger()).use(gammuProvider);
