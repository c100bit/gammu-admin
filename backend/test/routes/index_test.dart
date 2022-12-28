import 'dart:io';

import 'package:backend/gammu/cubit/gammu_cubit.dart';
import 'package:backend/gammu/events/gammu_event.dart';
import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/index.dart' as route;

class MockGammuCubit extends Mock implements GammuCubit {}

void main() {
  const msgName = 'msg';
  const msgFolder = Folder.inbox;
  final gammuCubit = MockGammuCubit();

  late final HttpServer server;
  late final WebSocketChannel socket;

  when(gammuCubit.fetchInbox).thenAnswer((_) async {});
  when(gammuCubit.fetchOutbox).thenAnswer((_) async {});
  when(gammuCubit.fetchError).thenAnswer((_) async {});
  when(gammuCubit.fetchSent).thenAnswer((_) async {});
  when(() => gammuCubit.fetchMessage(name: msgName, folder: msgFolder))
      .thenAnswer((_) async {});
  setUpAll(() async {
    server = await serve(
      (context) => route.onRequest(
        context.provide<GammuCubit>(() => gammuCubit),
      ),
      InternetAddress.anyIPv4,
      0,
    );
    socket = WebSocketChannel.connect(
      Uri.parse('ws://localhost:${server.port}'),
    );
  });

  tearDownAll(() => server.close(force: true));

  group('WS /', () {
    test('should call fetchInbox', () async {
      socket.sink.add('${GammuEvent.fetchInbox}');
      await untilCalled(gammuCubit.fetchInbox);
      verify(gammuCubit.fetchInbox).called(1);
    });

    test('should call fetchOutbox', () async {
      socket.sink.add('${GammuEvent.fetchOutbox}');
      await untilCalled(gammuCubit.fetchOutbox);
      verify(gammuCubit.fetchOutbox).called(1);
    });

    test('should call fetchSent', () async {
      socket.sink.add('${GammuEvent.fetchSent}');
      await untilCalled(gammuCubit.fetchSent);
      verify(gammuCubit.fetchSent).called(1);
    });

    test('should call fetchError', () async {
      socket.sink.add('${GammuEvent.fetchError}');
      await untilCalled(gammuCubit.fetchError);
      verify(gammuCubit.fetchError).called(1);
    });

    test('should call fetchMessage".', () async {
      socket.sink.add('${GammuEvent.fetchMessage}/$msgFolder/$msgName');
      await untilCalled(
        () => gammuCubit.fetchMessage(name: msgName, folder: msgFolder),
      );
      verify(
        () => gammuCubit.fetchMessage(name: msgName, folder: msgFolder),
      ).called(1);
    });
  });
}
