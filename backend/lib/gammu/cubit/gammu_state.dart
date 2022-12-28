part of 'gammu_cubit.dart';

abstract class GammuState extends Equatable {}

class GammuListState extends GammuState {
  GammuListState({
    required this.messages,
  });

  final List<Message> messages;

  @override
  String toString() => jsonEncode(messages);

  @override
  List<Object?> get props => [messages];
}

class GammuOneMsgState extends GammuState {
  GammuOneMsgState({
    required this.message,
  });

  final Message? message;

  @override
  String toString() => jsonEncode(message);

  @override
  List<Object?> get props => [message];
}
