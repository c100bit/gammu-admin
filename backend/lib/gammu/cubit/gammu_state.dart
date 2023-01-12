part of 'gammu_cubit.dart';

abstract class GammuState extends Equatable {
  const GammuState({
    required this.requestId,
  });

  final String requestId;
}

class GammuListState extends GammuState {
  const GammuListState({
    required super.requestId,
    required this.messages,
  });

  final List<Message> messages;

  @override
  String toString() => json.encode(toMap());

  @override
  List<Object?> get props => [messages];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}..addAll({
        'requestId': requestId,
        'messages': messages.map((x) => x.toMap()).toList()
      });

    return result;
  }
}

class GammuOneMsgState extends GammuState {
  const GammuOneMsgState({
    required super.requestId,
    this.message,
  });

  final Message? message;

  @override
  String toString() => json.encode(toMap());
  @override
  List<Object?> get props => [message];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (message != null) {
      result.addAll({'requestId': requestId, 'message': message!.toMap()});
    }

    return result;
  }
}
