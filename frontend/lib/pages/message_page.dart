import 'package:flutter/material.dart';

import '../services/gammu_service/folder.dart';

class MessagePage extends StatelessWidget {
  final String name;
  final Folder folder;

  const MessagePage({
    Key? key,
    required this.name,
    required this.folder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('MessagePage');
  }
}
