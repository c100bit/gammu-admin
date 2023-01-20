import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/gammu_service/message.dart';

import '../data/sms_list_source.dart';

class SmsListTable extends StatefulWidget {
  final bool isInbox;
  final SmsListSource source;
  final Widget? empty;
  final void Function(Message) onTap;
  final void Function(Messages) onRemoveTap;

  SmsListTable({
    Key? key,
    required this.isInbox,
    required this.onTap,
    Messages messages = const [],
    this.empty,
    required this.onRemoveTap,
  })  : source = SmsListSource(messages: messages, onTap: onTap),
        super(key: key);

  @override
  State<SmsListTable> createState() => _SmsListTableState();
}

class _SmsListTableState extends State<SmsListTable> {
  @override
  void initState() {
    widget.source.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        PaginatedDataTable2(
          source: widget.source,
          onSelectAll: (value) => widget.source.selectAll(value),
          empty: Center(child: widget.empty),
          columns: [
            const DataColumn2(label: Text('Date'), size: ColumnSize.S),
            const DataColumn2(label: Text('Name'), size: ColumnSize.L),
            DataColumn2(
                label: Text(widget.isInbox ? 'Sender' : 'Recipient'),
                size: ColumnSize.M),
            const DataColumn2(label: Text('Part'), size: ColumnSize.S),
          ],
        ),
        if (widget.source.selectedRowCount > 0)
          Positioned(
            left: 20,
            bottom: 20,
            child: TextButton(
              onPressed: () {
                final messages = widget.source.rows
                    .where((row) => row.selected)
                    .map((row) => row.message)
                    .toList();

                widget.onRemoveTap(messages);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child:
                  Text('Удалить выбранное (${widget.source.selectedRowCount})'),
            ),
          ),
      ],
    );
  }
}
