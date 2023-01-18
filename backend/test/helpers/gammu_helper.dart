import 'package:backend/gammu/enitities/gammu_command.dart';
import 'package:backend/gammu/enitities/gammu_event.dart';

String buildRequest({
  required String id,
  required GammuCommand cmd,
  Map<String, String> params = const {},
}) =>
    GammuEvent(id: id, cmd: cmd, params: params).toJson();
