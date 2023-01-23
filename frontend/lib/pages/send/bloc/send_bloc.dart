import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/gammu_service.dart';

part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  final GammuService gammuService;
  SendBloc({required this.gammuService}) : super(SendInitial()) {
    on<SendEvent>((event, emit) async {
      if (event is Send) {
        emit(Loading());
        await gammuService.sendMessage(phone: event.phone, text: event.text);
        emit(Sent());
      }
    });
  }
}
