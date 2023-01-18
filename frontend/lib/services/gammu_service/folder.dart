import 'package:frontend/core/extensions.dart';

enum Folder {
  outbox,
  inbox,
  error,
  sent;

  @override
  String toString() => name;

  bool isInbox() => name == Folder.inbox.name;

  factory Folder.fromMap(String cmd) =>
      cmd.toEnum<Folder>(Folder.values) ?? Folder.inbox;
}
