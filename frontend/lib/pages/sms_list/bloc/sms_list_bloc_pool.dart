import '../../../services/gammu_service.dart';
import '../../../services/gammu_service/folder.dart';
import 'sms_list_bloc.dart';

class SmsListBlocPool {
  final GammuService gammuService;
  final Map<Folder, SmsListBloc> _items;

  SmsListBlocPool({required this.gammuService})
      : _items = {
          Folder.inbox: SmsListBloc(gammuService: gammuService),
          Folder.sent: SmsListBloc(gammuService: gammuService),
          Folder.error: SmsListBloc(gammuService: gammuService),
          Folder.outbox: SmsListBloc(gammuService: gammuService),
        };

  SmsListBloc get(Folder folder) => _items[folder]!;
}
