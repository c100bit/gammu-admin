import 'package:backend/gammu/cubit/gammu_cubit.dart';
import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGammuService extends Mock implements GammuService {}

void main() {
  final gammuService = MockGammuService();
  const requestId = 'requestId';

  final msg = Message(
    name: 'msg',
    path: 'path',
    dateTime: DateTime.parse('2022-12-26 10:28:32'),
    sender: '+79112223344',
    order: 0,
    part: 0,
    folder: Folder.inbox,
  );

  final messages = [msg];

  when(gammuService.readInboxList).thenAnswer((_) async => messages);
  when(gammuService.readOutboxList).thenAnswer((_) async => messages);
  when(gammuService.readSentList).thenAnswer((_) async => messages);
  when(gammuService.readErrorList).thenAnswer((_) async => messages);
  when(() => gammuService.readMessage(msg.name, folder: Folder.inbox))
      .thenAnswer((_) async => msg);

  blocTest<GammuCubit, GammuState>(
    'should return messages when fetchInbox',
    build: () => GammuCubit(gammuService: gammuService),
    act: (cubit) => cubit.fetchInbox(requestId),
    expect: () => [GammuListState(requestId: requestId, messages: messages)],
  );

  blocTest<GammuCubit, GammuState>(
    'should return messages when fetchOutbox',
    build: () => GammuCubit(gammuService: gammuService),
    act: (cubit) => cubit.fetchOutbox(requestId),
    expect: () => [GammuListState(requestId: requestId, messages: messages)],
  );

  blocTest<GammuCubit, GammuState>(
    'should return messages when fetchSent',
    build: () => GammuCubit(gammuService: gammuService),
    act: (cubit) => cubit.fetchSent(requestId),
    expect: () => [GammuListState(requestId: requestId, messages: messages)],
  );

  blocTest<GammuCubit, GammuState>(
    'should return messages when fetchError',
    build: () => GammuCubit(gammuService: gammuService),
    act: (cubit) => cubit.fetchError(requestId),
    expect: () => [GammuListState(requestId: requestId, messages: messages)],
  );

  blocTest<GammuCubit, GammuState>(
    'should return message when fetchMessage',
    build: () => GammuCubit(gammuService: gammuService),
    act: (cubit) => cubit
        .fetchMessage(requestId, params: {'name': msg.name, 'folder': 'inbox'}),
    expect: () => [GammuOneMsgState(requestId: requestId, message: msg)],
  );
}
