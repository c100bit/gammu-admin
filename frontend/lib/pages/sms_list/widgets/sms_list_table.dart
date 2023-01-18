import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/sms_list/bloc/sms_list_bloc.dart';
import 'package:frontend/services/gammu_service/message.dart';

import '../data/sms_list_source.dart';

class SmsListTable extends StatelessWidget {
  final SmsListState state;
  final SmsListSource dataSource;
  final void Function(Message) onTap;
  final bool isInbox;
  late final Widget? empty;

  SmsListTable({
    Key? key,
    required this.state,
    required this.onTap,
    this.isInbox = false,
  })  : dataSource = SmsListSource(messages: state.messages, onTap: onTap),
        super(key: key) {
    switch (state.runtimeType) {
      case Loading:
        empty = const CircularProgressIndicator();
        break;
      case Error:
        final error = (state as Error).text;
        empty = Text('Something went wrong\nError - $error');
        break;
      case Empty:
        empty = const Text('There are no SMS');
        break;
      default:
        empty = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      source: dataSource,
      empty: Center(child: empty),
      columns: [
        const DataColumn2(label: Text('Date'), size: ColumnSize.S),
        const DataColumn2(label: Text('Name'), size: ColumnSize.L),
        DataColumn2(
            label: Text(isInbox ? 'Sender' : 'Recipient'), size: ColumnSize.M),
        const DataColumn2(label: Text('Part'), size: ColumnSize.S),
      ],
    );
  }
}
