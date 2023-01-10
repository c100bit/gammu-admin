part of 'sms_list_bloc.dart';

@immutable
abstract class SmsListState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends SmsListState {}

class Loaded extends SmsListState {
  final Messages messages;

  Loaded({required this.messages});
}

class Empty extends SmsListState {}

class Error extends SmsListState {
  final String message;

  Error({required this.message});
}
