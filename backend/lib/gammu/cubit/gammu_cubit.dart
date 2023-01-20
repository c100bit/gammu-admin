import 'dart:convert';
import 'package:backend/core/extensions.dart';
import 'package:backend/auth/helpers/auth_helper.dart';
import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:equatable/equatable.dart';

part 'gammu_state.dart';

class GammuCubit extends BroadcastCubit<GammuState> {
  GammuCubit({required this.gammuService})
      : super(const GammuListState(requestId: '', messages: []));
  final GammuService gammuService;

  Future<void> fetchInbox(String requestId) async {
    final messages = await gammuService.readInboxList();
    emit(GammuListState(requestId: requestId, messages: messages));
  }

  Future<void> fetchOutbox(String requestId) async {
    final messages = await gammuService.readOutboxList();
    emit(GammuListState(requestId: requestId, messages: messages));
  }

  Future<void> fetchError(String requestId) async {
    final messages = await gammuService.readErrorList();
    emit(GammuListState(requestId: requestId, messages: messages));
  }

  Future<void> fetchSent(String requestId) async {
    final messages = await gammuService.readSentList();
    emit(GammuListState(requestId: requestId, messages: messages));
  }

  Future<void> filterList(
    String requestId, {
    required Map<String, String> params,
  }) async {
    final folder = params['folder']?.toEnum<Folder>(Folder.values);
    if (folder == null || !params.containsKey('name')) {
      return emit(GammuListState(requestId: requestId, messages: const []));
    }
    final messages =
        await gammuService.filterList(params['name']!, folder: folder);
    emit(GammuListState(requestId: requestId, messages: messages));
  }

  Future<void> fetchMessage(
    String requestId, {
    required Map<String, String> params,
  }) async {
    final folder = params['folder']?.toEnum<Folder>(Folder.values);
    if (folder == null || !params.containsKey('name')) {
      return emit(GammuOneMsgState(requestId: requestId));
    }

    final message =
        await gammuService.readMessage(params['name']!, folder: folder);
    if (message == null) return emit(GammuOneMsgState(requestId: requestId));
    emit(GammuOneMsgState(requestId: requestId, message: message));
  }
}
