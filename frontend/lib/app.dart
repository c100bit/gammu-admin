import 'package:flutter/material.dart';
import 'package:frontend/di_container.dart';

import 'routes/app_router.gr.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gammu Admin',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
