import 'package:backend/gammu/handler/gammu_handler.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      final handler = context.read<GammuHandler>()..subscribe(channel);

      channel.stream.listen(
        handler,
        onDone: () => handler.unsubscribe(channel),
      );
    },
  );

  return handler(context);
}
