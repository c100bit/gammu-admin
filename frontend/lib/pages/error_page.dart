import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/gammu_service/folder.dart';

import '../routes/app_router.gr.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text('sms'),
        onTap: () => context.router
            .push(MessageRoute(name: 'name', folder: Folder.error)),
      ),
    );
  }
}
