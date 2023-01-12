import 'package:backend/core/constants.dart';
import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:dart_frog/dart_frog.dart';

import '../cubit/gammu_cubit.dart';
import '../handler/gammu_handler.dart';

GammuHandler? _gammuHandler;

final gammuProvider = provider<GammuHandler>(
  (_) => _gammuHandler ??= GammuHandler(
    cubit: GammuCubit(
      gammuService: GammuService(path: gammuPath),
    ),
  ),
);
