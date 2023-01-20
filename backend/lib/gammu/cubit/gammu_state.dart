part of 'gammu_cubit.dart';

abstract class GammuState extends Equatable {
  const GammuState({
    required this.requestId,
  });

  final String requestId;

  dynamic get data;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'requestId': requestId, 'data': data});
    return result;
  }

  @override
  String toString() => json.encode(toMap());
}

class GammuListState extends GammuState {
  const GammuListState({
    required super.requestId,
    required this.messages,
  });

  final List<Message> messages;

  @override
  List<Object?> get props => [requestId, messages];

  @override
  List<Map<String, dynamic>> get data =>
      messages.map((x) => x.toMap()).toList();
}

class GammuOneMsgState extends GammuState {
  const GammuOneMsgState({
    required super.requestId,
    this.message,
  });

  final Message? message;

  @override
  List<Object?> get props => [requestId, message];

  @override
  Map<String, dynamic>? get data => message?.toMap();
}
