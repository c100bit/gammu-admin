part of 'send_bloc.dart';

abstract class SendState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendInitial extends SendState {}

class Loading extends SendState {}

class Error extends SendState {
  final String message;

  @override
  List<Object?> get props => [message];

  Error(this.message);
}

class Sent extends SendState {}
