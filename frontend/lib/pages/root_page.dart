import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/di_container.dart';
import 'package:frontend/routes/app_router.gr.dart';

import '../vendors/salomon_bottom_bar.dart';
import 'message/bloc/sms_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => getIt<SmsListBlocPool>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => getIt<SmsBloc>())
        ],
        child: AutoTabsScaffold(
            appBarBuilder: (context, tabsRouter) => AppBar(
                  centerTitle: true,
                  title: const Text('Gammu Admin'),
                  leading: const AutoLeadingButton(),
                ),
            bottomNavigationBuilder: (context, tabsRouter) => SalomonBottomBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: [
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.try_sms_star),
                      title: const Text("Inbox"),
                      selectedColor: Colors.purple,
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.outbox),
                      title: const Text("Outbox"),
                      selectedColor: Colors.indigo,
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.sms),
                      title: const Text("Sent"),
                      selectedColor: Colors.green,
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.sms_failed),
                      title: const Text("Error"),
                      selectedColor: Colors.pink,
                    ),
                  ],
                ),
            routes: const [
              InboxTab(),
              OutboxTab(),
              SentTab(),
              ErrorTab(),
            ]),
      ),
    );
  }
}
