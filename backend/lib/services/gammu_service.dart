import 'dart:io';
import 'gammu_service/folder.dart';
import 'gammu_service/message.dart';

class GammuService {
  GammuService({required String path}) : folderPool = FolderPool(root: path);

  final msgExt = '.txt';

  final FolderPool folderPool;

  Future<Messages> readErrorList() => _readList(Folder.error);
  Future<Messages> readInboxList() => _readList(Folder.inbox);
  Future<Messages> readOutboxList() => _readList(Folder.outbox);
  Future<Messages> readSentList() => _readList(Folder.sent);

  Future<Messages> _readList(Folder folder) async {
    final list = await folderPool.getDirByFolder(folder)?.list().toList();
    if (list == null) return [];

    return list
        .whereType<File>()
        .map((file) => Message.fromFile(file, folder: folder))
        .toList()
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  Future<String?> readMessage(String name, {required Folder folder}) async {
    final path = folderPool.getFilePathByFolder('$name$msgExt', folder: folder);
    if (path == null) return null;

    final file = File(path);
    return Message.fromFile(file, folder: folder).read();
  }
}
