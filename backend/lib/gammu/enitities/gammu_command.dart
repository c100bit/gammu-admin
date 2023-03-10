import 'package:backend/core/extensions.dart';

enum GammuCommand {
  fetchInbox,
  fetchSent,
  fetchError,
  fetchOutbox,
  filterList,
  removeList,
  sendMessage,
  fetchMessage;

  factory GammuCommand.fromMap(String cmd) =>
      cmd.toEnum<GammuCommand>(GammuCommand.values) ?? GammuCommand.fetchInbox;

  @override
  String toString() => name;
}
