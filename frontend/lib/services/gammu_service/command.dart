enum Command {
  fetchInbox,
  fetchSent,
  fetchError,
  fetchOutbox,
  filterList,
  fetchMessage;

  @override
  String toString() => name;
}
