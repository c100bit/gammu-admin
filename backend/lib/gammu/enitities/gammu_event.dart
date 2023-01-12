import 'dart:convert';
import 'package:backend/gammu/enitities/gammu_command.dart';
import 'package:equatable/equatable.dart';

class GammuEvent extends Equatable {
  const GammuEvent({
    required this.id,
    required this.cmd,
    this.params = const {},
  });

  factory GammuEvent.fromJson(String source) =>
      GammuEvent.fromMap(jsonDecode(source) as Map<String, dynamic>);

  factory GammuEvent.fromMap(Map<String, dynamic> map) {
    return GammuEvent(
      id: map['id'] as String,
      cmd: GammuCommand.fromMap(map['cmd'] as String),
      params: map.containsKey('params')
          ? Map<String, String>.from(map['params'] as Map)
          : {},
    );
  }

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'cmd': cmd.toString()})
      ..addAll({'params': params});

    return result;
  }

  final String id;
  final GammuCommand cmd;
  final Map<String, String> params;

  @override
  List<Object?> get props => [id, cmd, params];

  @override
  String toString() => 'Request(id: $id, cmd: $cmd, params: $params)';
}
