part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class Error extends LoginState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}

class Authenticated extends LoginState {}
