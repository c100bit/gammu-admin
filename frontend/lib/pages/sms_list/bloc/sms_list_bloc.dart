import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/services/gammu_service.dart';
import 'package:frontend/services/gammu_service/folder.dart';

import '../../../services/gammu_service/message.dart';

part 'sms_list_event.dart';
part 'sms_list_state.dart';

class SmsListBloc extends Bloc<SmsListEvent, SmsListState> {
  final GammuService gammuService;

  SmsListBloc({
    required this.gammuService,
  }) : super(Loading()) {
    on<SmsListEvent>((event, emit) async {
      switch (event.runtimeType) {
        case FetchSmsList:
          final messages =
              await gammuService.fetchByFolder((event as FetchSmsList).folder);
          if (messages.isEmpty) return emit(Empty());
          emit(Loaded(messages: messages));
          break;

        case FilterSmsList:
          emit(Loading());
          final messages = await gammuService.filterList(
            (event as FilterSmsList).text,
            folder: event.folder,
          );
          if (messages.isEmpty) return emit(Empty());
          emit(Loaded(messages: messages));
          break;

        case RemoveList:
          emit(Loading());
          final messages = await gammuService.removeList(
            (event as RemoveList).messages,
            folder: event.folder,
          );
          emit(Loaded(messages: messages));
          break;
      }
    });
  }
}
