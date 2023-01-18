import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/extensions.dart';
import 'package:frontend/widgets/app_card.dart';

import '../../di_container.dart';
import '../../routes/app_router.gr.dart';
import '../../services/gammu_service/folder.dart';
import 'bloc/sms_list_bloc.dart';
import 'widgets/sms_list_table.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late final SmsListBloc bloc;
  late final Folder folder;

  @override
  void initState() {
    final folderParam = context.router.current.parent?.path;
    folder = '$folderParam'.toEnum<Folder>(Folder.values)!;
    bloc = context.read<SmsListBlocPool>().get(folder)
      ..add(FetchSmsList(folder: folder));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Search'),
            onChanged: (text) =>
                bloc.add(FilterSmsList(folder: folder, text: text)),
          ),
        ),
        BlocBuilder<SmsListBloc, SmsListState>(
          bloc: bloc,
          builder: (context, state) {
            return Expanded(
              child: SmsListTable(
                state: state,
                onTap: (message) => context.router.push(
                  MessageRoute(name: message.name),
                ),
                isInbox: folder == Folder.inbox,
              ),
            );
          },
        ),
      ],
    );
  }
}