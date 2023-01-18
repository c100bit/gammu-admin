import 'dart:io';

import 'package:backend/gammu/cubit/gammu_cubit.dart';
import 'package:backend/gammu/enitities/gammu_command.dart';
import 'package:backend/gammu/handler/gammu_handler.dart';
import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/index.dart' as route;
import '../helpers/gammu_helper.dart';

class MockGammuCubit extends Mock implements GammuCubit {}

void main() {
  const msgName = 'msg';
  const requestId = 'requestId';
  const msgFolder = Folder.inbox;
  final gammuCubit = MockGammuCubit();
  final gammuHandler = GammuHandler(cubit: gammuCubit);

  late final HttpServer server;
  late final WebSocketChannel socket;

  final params = {'name': msgName, 'folder': msgFolder.toString()};

  when(() => gammuCubit.fetchInbox(requestId)).thenAnswer((_) async {});
  when(() => gammuCubit.fetchOutbox(requestId)).thenAnswer((_) async {});
  when(() => gammuCubit.fetchError(requestId)).thenAnswer((_) async {});
  when(() => gammuCubit.fetchSent(requestId)).thenAnswer((_) async {});
  when(
    () => gammuCubit.fetchMessage(
      requestId,
      params: params,
    ),
  ).thenAnswer((_) async {});

  setUpAll(() async {
    server = await serve(
      (context) => route.onRequest(
        context.provide<GammuHandler>(() => gammuHandler),
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
      final request = buildRequest(id: requestId, cmd: GammuCommand.fetchInbox);
      socket.sink.add(request);
      await untilCalled(() => gammuCubit.fetchInbox(requestId));
      verify(() => gammuCubit.fetchInbox(requestId)).called(1);
    });

    test('should call fetchOutbox', () async {
      final request =
          buildRequest(id: requestId, cmd: GammuCommand.fetchOutbox);
      socket.sink.add(request);
      await untilCalled(() => gammuCubit.fetchOutbox(requestId));
      verify(() => gammuCubit.fetchOutbox(requestId)).called(1);
    });

    test('should call fetchSent', () async {
      final request = buildRequest(id: requestId, cmd: GammuCommand.fetchSent);
      socket.sink.add(request);
      await untilCalled(() => gammuCubit.fetchSent(requestId));
      verify(() => gammuCubit.fetchSent(requestId)).called(1);
    });

    test('should call fetchError', () async {
      final request = buildRequest(id: requestId, cmd: GammuCommand.fetchError);
      socket.sink.add(request);
      await untilCalled(() => gammuCubit.fetchError(requestId));
      verify(() => gammuCubit.fetchError(requestId)).called(1);
    });

    test('should call fetchMessage".', () async {
      final request = buildRequest(
        id: requestId,
        cmd: GammuCommand.fetchMessage,
        params: {'name': msgName, 'folder': '$msgFolder'},
      );
      socket.sink.add(request);
      await untilCalled(
        () => gammuCubit.fetchMessage(
          requestId,
          params: params,
        ),
      );
      verify(
        () => gammuCubit.fetchMessage(
          requestId,
          params: params,
        ),
      ).called(1);
    });
  });
}
