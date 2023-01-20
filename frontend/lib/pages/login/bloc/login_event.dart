part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Login extends LoginEvent {
  final String login;
  final String password;
  final void Function(bool) onResult;

  Login({
    required this.login,
    required this.password,
    required this.onResult,
  }) {
    debugPrint('$this');
  }
}
