import '../../../services/gammu_service/message.dart';

typedef MessageRows = List<MessageRow>;

class MessageRow {
  final Message message;
  bool selected;

  MessageRow({
    required this.message,
    this.selected = false,
  });
}
