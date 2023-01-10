import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/di_container.dart';
import 'package:frontend/pages/list_page/bloc/sms_list_bloc.dart';

import '../../routes/app_router.gr.dart';
import '../../services/gammu_service/folder.dart';

class ListPage extends StatelessWidget {
  final bloc = getIt<SmsListBloc>();

  ListPage({Key? key}) : super(key: key) {
    bloc.add(FetchSmsList(folder: Folder.inbox));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmsListBloc, SmsListState>(
      bloc: bloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case Empty:
            return Text('No Sms');
          case Error:
            return Text('Error');
          case Loaded:
            return ListView.builder(
              itemCount: (state as Loaded).messages.length,
              itemBuilder: (context, index) {
                final message = state.messages[index];

                return ListTile(
                  title: Text(message.name),
                  onTap: () => context.router.push(
                    MessageRoute(
                      name: 'name',
                      folder: Folder.error,
                    ),
                  ),
                );
              },
            );
        }
        return Text('Loading');
      },
    );
  }
}
