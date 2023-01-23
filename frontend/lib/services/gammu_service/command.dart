enum Command {
  fetchInbox,
  fetchSent,
  fetchError,
  fetchOutbox,
  filterList,
  removeList,
  sendMessage,
  fetchMessage;

  @override
  String toString() => name;
}
