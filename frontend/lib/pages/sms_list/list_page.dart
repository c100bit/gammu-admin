import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/extensions.dart';

import '../../routes/app_router.gr.dart';
import '../../services/gammu_service/folder.dart';
import 'bloc/sms_list_bloc.dart';
import 'bloc/sms_list_bloc_pool.dart';
import 'data/sms_list_source.dart';
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
                key: UniqueKey(),
                messages: state.messages,
                onTap: (message) => context.router.push(
                  MessageRoute(name: message.name),
                ),
                empty: _buildEmpty(state.runtimeType),
                isInbox: folder == Folder.inbox,
                onRemoveTap: (messages) => bloc.add(RemoveList(
                  messages: messages,
                  folder: folder,
                )),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget? _buildEmpty(Type state) {
    switch (state) {
      case Loading:
        return const CircularProgressIndicator();

      case Error:
        final error = (state as Error).text;
        return Text('Something went wrong\nError - $error');

      case Empty:
        return const Text('There are no SMS');
    }
    return null;
  }
}
