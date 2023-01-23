import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/services/gammu_service.dart';

import '../../../services/gammu_service/failures.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GammuService gammuService;
  LoginBloc({required this.gammuService}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        emit(Loading());
        final result = await gammuService.connect(
            login: event.login, password: event.password);
        result.fold(
          (l) => (l is ServerFailure)
              ? emit(Error('Server Error'))
              : emit(Error('Auth Error')),
          (r) => event.onResult(true),
        );
      }
    });
  }
}
