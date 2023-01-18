import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/gammu_service/message.dart';
import 'package:intl/intl.dart';

class SmsListSource extends DataTableSource {
  final Messages messages;
  final void Function(Message) onTap;
  final dateFormat = DateFormat('yyyy-MM-dd hh:mm');
  SmsListSource({
    required this.messages,
    required this.onTap,
  });

  @override
  DataRow getRow(int index) {
    final message = messages[index];
    final date = dateFormat.format(message.dateTime);
    return DataRow2.byIndex(
      onTap: () => onTap(message),
      index: index,
      cells: [
        DataCell(Text(date)),
        DataCell(Text(message.name)),
        DataCell(Text(message.sender)),
        DataCell(Text('${message.part}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => messages.length;

  @override
  int get selectedRowCount => 0;
}
