import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'folder.dart';

typedef Messages = List<Message>;

class Message extends Equatable {
  const Message({
    required this.name,
    required this.text,
    required this.folder,
    required this.dateTime,
    required this.sender,
    required this.order,
    required this.part,
  });

  final String name;
  final String text;
  final Folder folder;
  final DateTime dateTime;
  final String sender;
  final int order;
  final int part;

  @override
  List<Object?> get props =>
      [name, dateTime, folder, sender, order, part, text];

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      name: map['name'] ?? '',
      text: map['text'] ?? '',
      folder: Folder.fromMap(map['folder']),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      sender: map['sender'] ?? '',
      order: map['order']?.toInt() ?? 0,
      part: map['part']?.toInt() ?? 0,
    );
  }

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));
}
