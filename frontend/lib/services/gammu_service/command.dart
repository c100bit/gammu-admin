enum Command {
  fetchInbox,
  fetchSent,
  fetchError,
  fetchOutbox,
  fetchMessage;

  @override
  String toString() => name;
}
