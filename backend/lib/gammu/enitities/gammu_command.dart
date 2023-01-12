import 'package:backend/core/extensions.dart';

enum GammuCommand {
  fetchInbox,
  fetchSent,
  fetchError,
  fetchOutbox,
  fetchMessage;

  factory GammuCommand.fromMap(String cmd) =>
      cmd.toEnum<GammuCommand>(GammuCommand.values) ?? GammuCommand.fetchInbox;

  @override
  String toString() => name;
}
