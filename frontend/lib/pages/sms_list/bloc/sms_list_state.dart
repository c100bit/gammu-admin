part of 'sms_list_bloc.dart';

@immutable
abstract class SmsListState extends Equatable {
  final Messages messages;

  const SmsListState({this.messages = const []});

  @override
  List<Object> get props => [messages];
}

class Loading extends SmsListState {}

class Loaded extends SmsListState {
  const Loaded({required super.messages});
}

class Empty extends SmsListState {}

class Error extends SmsListState {
  final String text;

  @override
  List<Object> get props => [text];

  const Error({required this.text});
}
