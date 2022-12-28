import 'dart:convert';

import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

part 'gammu_state.dart';

class GammuCubit extends BroadcastCubit<GammuState> {
  GammuCubit({required this.gammuService})
      : super(GammuListState(messages: []));
  final GammuService gammuService;

  Future<void> fetchInbox() async {
    final messages = await gammuService.readInboxList();
    emit(GammuListState(messages: messages));
  }

  Future<void> fetchOutbox() async {
    final messages = await gammuService.readOutboxList();
    emit(GammuListState(messages: messages));
  }

  Future<void> fetchError() async {
    final messages = await gammuService.readErrorList();
    emit(GammuListState(messages: messages));
  }

  Future<void> fetchSent() async {
    final messages = await gammuService.readSentList();
    emit(GammuListState(messages: messages));
  }

  Future<void> fetchMessage({
    required String name,
    required Folder folder,
  }) async {
    final message = await gammuService.readMessage(name, folder: folder);
    emit(GammuOneMsgState(message: message));
  }
}
