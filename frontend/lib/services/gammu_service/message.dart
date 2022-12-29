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
}
