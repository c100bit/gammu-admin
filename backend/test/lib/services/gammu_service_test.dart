import 'package:backend/services/gammu_service/gammu_service.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import '../../fixtures/fixtures_helper.dart';

void main() {
  final rootPath = fixturePath('gammu');
  final service = GammuService(path: rootPath);

  test('should read a message', () async {
    const name = 'IN20221220_041921_00_MTC_00';
    const text =
        'Пора пополнить счет! Сейчас на балансе 11 руб. Оплачивать без ';
    final message = await service.readMessage(name, folder: Folder.inbox);
    expect(text, equals(message?.text));
  });

  test('should get outbox messages list', () async {
    const name1 = 'OUTC20221226_102832_00_+79112223344_sms0';
    final path1 = p.join(rootPath, 'outbox', '$name1.txt');
    final msg1 = Message(
      name: name1,
      path: path1,
      dateTime: DateTime.parse('2022-12-26 10:28:32'),
      sender: '+79112223344',
      order: 0,
      part: 0,
      folder: Folder.outbox,
    );

    const name2 = 'OUTC20221226_1028319_00_+79112223344_sms0';
    final path2 = p.join(rootPath, 'outbox', '$name2.txt');
    final msg2 = Message(
      name: name2,
      path: path2,
      dateTime: DateTime.parse('2022-12-26 10:28:31'),
      sender: '+79112223344',
      order: 0,
      part: 0,
      folder: Folder.outbox,
    );

    final list = await service.readOutboxList();
    expect(list, equals([msg1, msg2]));
  });

  test('should get inbox messages list', () async {
    const name1 = 'IN20221220_041921_00_MTC_00';
    final path1 = p.join(rootPath, 'inbox', '$name1.txt');
    final msg1 = Message(
      name: name1,
      path: path1,
      dateTime: DateTime.parse('2022-12-20 04:19:21'),
      sender: 'MTC',
      order: 0,
      part: 0,
      folder: Folder.inbox,
    );

    const name2 = 'IN20221220_041921_00_MTC_01';
    final path2 = p.join(rootPath, 'inbox', '$name2.txt');
    final msg2 = Message(
      name: name2,
      path: path2,
      dateTime: DateTime.parse('2022-12-20 04:19:21'),
      sender: 'MTC',
      order: 0,
      part: 1,
      folder: Folder.inbox,
    );

    final list = await service.readInboxList();
    expect(list, equals([msg1, msg2]));
  });
}
