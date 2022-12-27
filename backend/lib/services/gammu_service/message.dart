import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:path/path.dart' as p;

import 'folder.dart';

typedef Messages = List<Message>;

class Message extends Equatable {
  const Message({
    required this.name,
    required this.folder,
    required this.path,
    required this.dateTime,
    required this.sender,
    required this.order,
    required this.part,
  });

  factory Message.fromFile(File file, {required Folder folder}) {
    final name = p.basenameWithoutExtension(file.path);
    final path = file.path;
    final data = name.split('_');
    final date = folder.isInbox() ? data[0].substring(2) : data[0].substring(4);
    final time = data[1].substring(0, 6);
    final dateTime = DateTime.parse('$date $time');
    final order = int.parse(data[2]);
    final sender = data[3];
    final part =
        folder.isInbox() ? int.parse(data[4]) : int.parse(data[4].substring(3));

    return Message(
      folder: folder,
      name: name,
      path: path,
      dateTime: dateTime,
      sender: sender,
      order: order,
      part: part,
    );
  }

  final String name;
  final Folder folder;
  final String path;
  final DateTime dateTime;
  final String sender;
  final int order;
  final int part;

  Future<String> read() => File(path).readAsString();

  @override
  List<Object?> get props => [name, path, dateTime, sender, order, part];
}
