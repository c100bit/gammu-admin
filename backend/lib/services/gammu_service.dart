// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:path/path.dart' as p;

typedef Messages = List<Message>;

class Message extends Equatable {
  const Message({
    required this.name,
    required this.path,
    required this.dateTime,
    required this.sender,
    required this.order,
    required this.part,
  });

  factory Message.fromFile(File file) {
    final name = p.basenameWithoutExtension(file.path);
    final path = file.path;
    final inMsg = name[0] == 'I';
    final data = name.split('_');
    final date = inMsg ? data[0].substring(2) : data[0].substring(4);
    final time = data[1].substring(0, 6);
    final dateTime = DateTime.parse('$date $time');
    final order = int.parse(data[2]);
    final sender = data[3];
    final part = inMsg ? int.parse(data[4]) : int.parse(data[4].substring(3));

    return Message(
      name: name,
      path: path,
      dateTime: dateTime,
      sender: sender,
      order: order,
      part: part,
    );
  }

  final String name;
  final String path;
  final DateTime dateTime;
  final String sender;
  final int order;
  final int part;

  @override
  List<Object?> get props => [name, path, dateTime, sender, order, part];
}

class GammuService {
  GammuService(this.rootPath)
      : _errorDir = Directory(p.join(rootPath, 'error')),
        _inboxDir = Directory(p.join(rootPath, 'inbox')),
        _outboxDir = Directory(p.join(rootPath, 'outbox')),
        _sentDir = Directory(p.join(rootPath, 'sent'));

  final String rootPath;
  final Directory _errorDir;
  final Directory _inboxDir;
  final Directory _outboxDir;
  final Directory _sentDir;

  Future<Messages> readErrorList() => _readList(_errorDir);
  Future<Messages> readInboxList() => _readList(_inboxDir);
  Future<Messages> readOutboxList() => _readList(_outboxDir);
  Future<Messages> readSentList() => _readList(_sentDir);

  Future<Messages> _readList(Directory dir) async {
    final list = await dir.list().toList();
    return list.whereType<File>().map(Message.fromFile).toList()
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  Future<Message> readMessage(String path) async {
    final file = File(path);
    return Message.fromFile(file);
  }
}
