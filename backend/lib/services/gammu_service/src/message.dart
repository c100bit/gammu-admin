import 'dart:io';

import 'package:charset/charset.dart';
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
    this.text,
  });

  static Future<Message> fromFile(
    File file, {
    required Folder folder,
    bool withContent = false,
  }) async {
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

    final content = withContent ? await _readContent(file) : '';

    return Message(
      folder: folder,
      name: name,
      path: path,
      dateTime: dateTime,
      sender: sender,
      order: order,
      part: part,
      text: content,
    );
  }

  final String name;
  final Folder folder;
  final String path;
  final DateTime dateTime;
  final String sender;
  final int order;
  final int part;
  final String? text;

  @override
  List<Object?> get props => [name, path, dateTime, sender, order, part, text];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'name': name})
      ..addAll({'folder': '$folder'})
      ..addAll({'text': text})
      ..addAll({'dateTime': dateTime.millisecondsSinceEpoch})
      ..addAll({'sender': sender})
      ..addAll({'order': order})
      ..addAll({'part': part});

    return result;
  }

  static Future<String> _readContent(File file) async {
    late final String content;

    try {
      content = await file.readAsString();
    } on FileSystemException {
      final bytes = await file.readAsBytes();
      content = utf16.decode(bytes);
    }
    return content;
  }
}
