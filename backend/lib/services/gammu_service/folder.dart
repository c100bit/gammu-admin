import 'dart:io';

import 'package:path/path.dart' as p;

enum Folder {
  outbox,
  inbox,
  error,
  sent;

  @override
  String toString() => name;

  bool isInbox() => name == Folder.inbox.name;
}

class FolderPool {
  FolderPool({
    required this.root,
  }) {
    _dirPool = {
      Folder.outbox: _buildDir(Folder.outbox),
      Folder.inbox: _buildDir(Folder.inbox),
      Folder.error: _buildDir(Folder.error),
      Folder.sent: _buildDir(Folder.sent),
    };
  }

  final String root;
  late final Map<Folder, Directory> _dirPool;

  Directory _buildDir(Folder folder) => Directory(p.join(root, '$folder'));

  Directory? getDirByFolder(Folder folder) => _dirPool[folder];
  String? getFilePathByFolder(String name, {required Folder folder}) {
    final dirPath = _dirPool[folder]?.path;
    if (dirPath == null) return null;

    return p.join(dirPath, name);
  }
}
