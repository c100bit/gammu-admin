import 'package:frontend/services/gammu_service.dart';
import 'package:frontend/services/gammu_service/folder.dart';
import 'package:frontend/settings.dart';
import 'package:get_it/get_it.dart';

import 'pages/message/bloc/sms_bloc.dart';
import 'pages/sms_list/bloc/sms_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(GammuService()..connect(gammuUrl));
  getIt.registerSingleton(SmsListBlocPool(gammuService: getIt()));
  getIt.registerFactory(() => SmsBloc(gammuService: getIt()));
}

class SmsListBlocPool {
  final GammuService gammuService;
  final Map<Folder, SmsListBloc> _items;

  SmsListBlocPool({required this.gammuService})
      : _items = {
          Folder.inbox: SmsListBloc(gammuService: getIt()),
          Folder.sent: SmsListBloc(gammuService: getIt()),
          Folder.error: SmsListBloc(gammuService: getIt()),
          Folder.outbox: SmsListBloc(gammuService: getIt()),
        };

  SmsListBloc get(Folder folder) => _items[folder]!;
}
