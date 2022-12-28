enum GammuEvent {
  fetchInbox,
  fetchSent,
  fetchError,
  fetchOutbox,
  fetchMessage;

  @override
  String toString() => name;
}
