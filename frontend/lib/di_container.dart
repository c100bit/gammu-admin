import 'package:frontend/pages/login/bloc/login_bloc.dart';
import 'package:frontend/routes/app_router.gr.dart';
import 'package:frontend/routes/auth_guard.dart';
import 'package:frontend/services/gammu_service.dart';
import 'package:frontend/settings.dart';
import 'package:get_it/get_it.dart';

import 'pages/message/bloc/sms_bloc.dart';
import 'pages/send/bloc/send_bloc.dart';
import 'pages/sms_list/bloc/sms_list_bloc_pool.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(GammuService(url: gammuUrl));
  getIt.registerSingleton(
      AppRouter(authGuard: AuthGuard(gammuService: getIt())));
  getIt.registerSingleton(SmsListBlocPool(gammuService: getIt()));
  getIt.registerFactory(() => SmsBloc(gammuService: getIt()));
  getIt.registerFactory(() => LoginBloc(gammuService: getIt()));
  getIt.registerFactory(() => SendBloc(gammuService: getIt()));
}
