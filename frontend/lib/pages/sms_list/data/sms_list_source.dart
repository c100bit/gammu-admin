import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../services/gammu_service/message.dart';
import 'message_row.dart';

class SmsListSource extends DataTableSource {
  final MessageRows rows;
  int _selectedCount = 0;
  final void Function(Message) onTap;
  final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  SmsListSource({
    required Messages messages,
    required this.onTap,
  }) : rows = messages
            .map((message) => MessageRow(message: message))
            .toList(growable: false);

  void selectAll(bool? selected) {
    for (var row in rows) {
      row.selected = selected ?? false;
    }
    _selectedCount = (selected ?? false) ? rows.length : 0;
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final row = rows[index];
    final message = row.message;
    final date = dateFormat.format(message.dateTime);

    return DataRow2.byIndex(
      selected: row.selected,
      onTap: () => onTap(message),
      onSelectChanged: (value) {
        if (row.selected == value) return;

        row.selected = value ?? false;
        _selectedCount += (value ?? false) ? 1 : -1;
        notifyListeners();
      },
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
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => _selectedCount;
}
