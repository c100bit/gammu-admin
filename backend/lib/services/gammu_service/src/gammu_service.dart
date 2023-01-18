import 'dart:io';

import 'package:path/path.dart' as p;

import 'folder.dart';
import 'message.dart';

class GammuService {
  GammuService({required String path}) : folderPool = FolderPool(root: path);

  final msgExt = '.txt';

  final FolderPool folderPool;

  Future<Messages> readErrorList() => _readList(Folder.error);
  Future<Messages> readInboxList() => _readList(Folder.inbox);
  Future<Messages> readOutboxList() => _readList(Folder.outbox);
  Future<Messages> readSentList() => _readList(Folder.sent);
  Future<Messages> filterList(String name, {required Folder folder}) =>
      _readList(folder, name: name.toLowerCase());

  Future<Messages> _readList(Folder folder, {String? name}) async {
    final list = await folderPool.getDirByFolder(folder)?.list().toList();
    if (list == null) return [];

    final files = list.whereType<File>();
    final filtered = name == null
        ? files
        : files.where(
            (file) => p
                .basenameWithoutExtension(file.path)
                .toLowerCase()
                .contains(name),
          );
    final messages = await Future.wait(
      filtered.map((file) => Message.fromFile(file, folder: folder)).toList(),
    );

    return messages..sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  Future<Message?> readMessage(String name, {required Folder folder}) async {
    final path = folderPool.getFilePathByFolder('$name$msgExt', folder: folder);
    if (path == null) return null;

    final file = File(path);
    return Message.fromFile(
      file,
      folder: folder,
      withContent: true,
    );
  }
}
