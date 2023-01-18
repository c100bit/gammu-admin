import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/services/gammu_service/command.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:web_socket_channel/status.dart' as status;

import 'gammu_service/folder.dart';
import 'gammu_service/message.dart';

class GammuService {
  WebSocketChannel? _channel;
  final _requests = <String, Completer>{};

  void _handler(dynamic message) {
    final decodedJson = jsonDecode(message);
    final id = decodedJson['requestId'];
    final data = decodedJson['data'];

    if (_requests.containsKey(id)) {
      _requests[id]!.complete(data);
      _requests.remove(id);
    }
  }

  Future<Messages> fetchByFolder(Folder folder) {
    switch (folder) {
      case Folder.inbox:
        return fetchInbox();
      case Folder.sent:
        return fetchSent();
      case Folder.error:
        return fetchError();
      case Folder.outbox:
        return fetchOutbox();
    }
  }

  Future<Messages> filterList(String name, {required Folder folder}) =>
      _emit(Command.filterList,
          params: {'name': name, 'folder': '$folder'},
          extractor: _extractMessages);

  Messages _extractMessages(dynamic data) =>
      (data as List).map((e) => Message.fromMap(e)).toList();

  Message _extractMessage(dynamic data) => Message.fromMap(data);

  Future<Messages> fetchInbox() =>
      _emit(Command.fetchInbox, extractor: _extractMessages);
  Future<Messages> fetchError() =>
      _emit(Command.fetchError, extractor: _extractMessages);
  Future<Messages> fetchSent() =>
      _emit(Command.fetchSent, extractor: _extractMessages);
  Future<Messages> fetchOutbox() =>
      _emit(Command.fetchOutbox, extractor: _extractMessages);

  Future<Message> fetchMessage(
          {required String name, required Folder folder}) =>
      _emit(Command.fetchMessage,
          params: {'name': name, 'folder': '$folder'},
          extractor: _extractMessage);

  Future<T> _emit<T>(Command cmd,
      {required T Function(dynamic) extractor,
      Map<String, String>? params = const {}}) async {
    final requestId = _getUniqueId();
    final completer = Completer<dynamic>();

    final request = {
      'id': requestId,
      'cmd': '$cmd',
      'params': params,
    };

    debugPrint('$request');

    _requests[requestId] = completer;
    _channel?.sink.add(jsonEncode(request));

    final data = await completer.future;
    return extractor(data);
  }

  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel?.stream
        .listen(_handler, onError: (error) => debugPrint(error.toString()));
  }

  void close() {
    _channel?.sink.close(status.goingAway);
  }

  String _getUniqueId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
