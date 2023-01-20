enum Command {
  fetchInbox,
  fetchSent,
  fetchError,
  fetchOutbox,
  filterList,
  removeList,
  fetchMessage;

  @override
  String toString() => name;
}
