part of 'sms_bloc.dart';

@immutable
abstract class SmsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends SmsState {}

class Loaded extends SmsState {
  final Message message;

  @override
  List<Object> get props => [message];

  Loaded({required this.message});
}

class Empty extends SmsState {}

class Error extends SmsState {
  final String msg;

  @override
  List<Object> get props => [msg];

  Error({required this.msg});
}
