import 'dart:async';

import 'package:frontend/services/gammu_service/command.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'gammu_service/folder.dart';
import 'gammu_service/message.dart';

class GammuService {
  IOWebSocketChannel? _channel;
  final _commandsPool = <Completer>[];

  void _handler(dynamic message) {
    print(message);
    _channel?.sink.add('received!');
  }

  Future<Messages> fetchByFolder(Folder folder) {
    switch (folder) {
      case Folder.inbox:
        return _emit<Messages>(Command.fetchInbox);
      case Folder.sent:
        return _emit<Messages>(Command.fetchSent);
      case Folder.error:
        return _emit<Messages>(Command.fetchError);
      case Folder.outbox:
        return _emit<Messages>(Command.fetchOutbox);
    }
  }

  Future<Messages> fetchInbox() => _emit<Messages>(Command.fetchInbox);
  Future<Messages> fetchError() => _emit<Messages>(Command.fetchError);
  Future<Messages> fetchSent() => _emit<Messages>(Command.fetchSent);
  Future<Messages> fetchOutbox() => _emit<Messages>(Command.fetchOutbox);
  Future<Message> fetchMessage() => _emit<Message>(Command.fetchMessage);

  Future<T> _emit<T>(Command cmd) {
    final completer = Completer<T>();
    _commandsPool.add(completer);
    _channel?.sink.add(cmd);

    return completer.future;
  }

  void connect(String url) {
    _channel = IOWebSocketChannel.connect(Uri.parse(url));
    _channel?.stream.listen(_handler);
  }

  void close() {
    _channel?.sink.close(status.goingAway);
  }
}
