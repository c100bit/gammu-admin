import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/extensions.dart';
import 'package:intl/intl.dart';

import '../../services/gammu_service/folder.dart';
import '../../widgets/app_card.dart';
import 'bloc/sms_bloc.dart';

class MessagePage extends StatefulWidget {
  final String name;

  const MessagePage({
    Key? key,
    @pathParam required this.name,
  }) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  void initState() {
    final folderParam = context.router.current.parent?.path;
    final folder = '$folderParam'.toEnum<Folder>(Folder.values);

    context.read<SmsBloc>().add(
          FetchSms(name: widget.name, folder: folder!),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SmsBloc, SmsState>(builder: (context, state) {
        switch (state.runtimeType) {
          case Empty:
            return const AppCard(child: Text('There is no text'));
          case Error:
            return const AppCard(child: Text('Something went wrong'));
          case Loaded:
            final message = (state as Loaded).message;
            final date = dateFormat.format(message.dateTime);
            return AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' ${message.name}'),
                  Text(date),
                  Text(
                    '${message.sender}\n',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(message.text),
                ],
              ),
            );
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
