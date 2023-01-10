import 'package:frontend/pages/list_page/bloc/sms_list_bloc.dart';
import 'package:frontend/services/gammu_service.dart';
import 'package:frontend/settings.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(GammuService()..connect(gammuUrl));
  getIt.registerFactory(() => SmsListBloc(gammuService: getIt()));
}
