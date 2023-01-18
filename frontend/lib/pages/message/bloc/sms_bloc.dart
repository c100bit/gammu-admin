import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/gammu_service.dart';
import '../../../services/gammu_service/folder.dart';
import '../../../services/gammu_service/message.dart';

part 'sms_event.dart';
part 'sms_state.dart';

class SmsBloc extends Bloc<SmsEvent, SmsState> {
  final GammuService gammuService;

  SmsBloc({
    required this.gammuService,
  }) : super(Empty()) {
    on<SmsEvent>((event, emit) async {
      switch (event.runtimeType) {
        case FetchSms:
          emit(Loading());
          final message = await gammuService.fetchMessage(
            name: (event as FetchSms).name,
            folder: event.folder,
          );
          emit(Loaded(message: message));
          break;
      }
    });
  }
}
