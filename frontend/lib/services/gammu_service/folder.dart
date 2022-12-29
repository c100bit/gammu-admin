enum Folder {
  outbox,
  inbox,
  error,
  sent;

  @override
  String toString() => name;

  bool isInbox() => name == Folder.inbox.name;
}
