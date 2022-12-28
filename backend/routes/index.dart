import 'package:backend/core/extensions.dart';
import 'package:backend/gammu/cubit/gammu_cubit.dart';
import 'package:backend/gammu/events/gammu_event.dart';
import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      final cubit = context.read<GammuCubit>()..subscribe(channel);

      channel.stream.listen(
        (event) {
          switch ('$event'.toEnum<GammuEvent>(GammuEvent.values)) {
            case GammuEvent.fetchInbox:
              cubit.fetchInbox();
              break;
            case GammuEvent.fetchSent:
              cubit.fetchSent();
              break;
            case GammuEvent.fetchError:
              cubit.fetchError();
              break;
            case GammuEvent.fetchOutbox:
              cubit.fetchOutbox();
              break;
            case GammuEvent.fetchMessage:
              final data = '$event'.split('/');
              final folder = data[1].toEnum<Folder>(Folder.values);
              if (folder == null) break;

              cubit.fetchMessage(name: data[2], folder: folder);
              break;
            case null:
              break;
          }
        },
        onDone: () => cubit.unsubscribe(channel),
      );
    },
  );

  return handler(context);
}
