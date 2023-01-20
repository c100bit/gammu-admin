import 'package:equatable/equatable.dart';

class Success {}

abstract class Failure extends Equatable {
  final String? message;

  const Failure([this.message]);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message]);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message]);
}
