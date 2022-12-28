import 'package:backend/core/constants.dart';
import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:dart_frog/dart_frog.dart';

import '../cubit/gammu_cubit.dart';

final gammuProvider = provider<GammuCubit>(
  (_) => GammuCubit(gammuService: GammuService(path: gammuPath)),
);
