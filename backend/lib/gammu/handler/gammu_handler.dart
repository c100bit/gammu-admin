import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

import '../cubit/gammu_cubit.dart';
import '../enitities/gammu_command.dart';
import '../enitities/gammu_event.dart';

class GammuHandler {
  GammuHandler({required this.cubit});

  final GammuCubit cubit;

  void call(dynamic request) {
    final event = GammuEvent.fromJson('$request');
    switch (event.cmd) {
      case GammuCommand.fetchInbox:
        cubit.fetchInbox(event.id);
        break;
      case GammuCommand.fetchSent:
        cubit.fetchSent(event.id);
        break;
      case GammuCommand.fetchError:
        cubit.fetchError(event.id);
        break;
      case GammuCommand.fetchOutbox:
        cubit.fetchOutbox(event.id);
        break;
      case GammuCommand.fetchMessage:
        cubit.fetchMessage(event.id, params: event.params);
        break;
      case GammuCommand.filterList:
        cubit.filterList(event.id, params: event.params);
        break;
    }
  }

  void subscribe(WebSocketChannel channel) => cubit.subscribe(channel);

  void unsubscribe(WebSocketChannel channel) => cubit.unsubscribe(channel);
}
