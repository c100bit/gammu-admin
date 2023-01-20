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

  Future<Messages> removeList(
    List<String> names, {
    required Folder folder,
  }) async {
    final filtered = await _filteredFiles(folder, names: names);
    await Future.wait(filtered.map((file) => file.delete()));
    return _readList(folder);
  }

  Future<Iterable<File>> _filteredFiles(
    Folder folder, {
    List<String> names = const [],
    bool similar = false,
  }) async {
    final lowerNames = names.map((name) => name.toLowerCase());
    final list = await folderPool.getDirByFolder(folder)?.list().toList();
    if (list == null) return [];

    final files = list.whereType<File>();
    return names.isEmpty
        ? files
        : files.where((file) {
            final fileName =
                p.basenameWithoutExtension(file.path).toLowerCase();
            if (similar) {
              return lowerNames.where(fileName.contains).isNotEmpty;
            }
            return lowerNames.contains(fileName);
          });
  }

  Future<Messages> _readList(Folder folder, {String? name}) async {
    final names = name != null ? [name] : <String>[];
    final filtered = await _filteredFiles(folder, names: names, similar: true);
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
