import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../pages/home_page.dart';
import '../pages/list_page/list_page.dart';
import '../pages/message_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HomePage, path: '/', children: [
      AutoRoute(
        path: 'inbox',
        name: 'InboxTab',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: ListPage),
          AutoRoute(path: ':name', page: MessagePage),
        ],
      ),
      AutoRoute(
        path: 'outbox',
        name: 'OutboxTab',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: ListPage),
          AutoRoute(path: ':name', page: MessagePage),
        ],
      ),
      AutoRoute(
        path: 'sent',
        name: 'SentTab',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: ListPage),
          AutoRoute(path: ':name', page: MessagePage),
        ],
      ),
      AutoRoute(
        path: 'error',
        name: 'ErrorTab',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: ListPage),
          AutoRoute(path: ':name', page: MessagePage),
        ],
      ),
    ]),
  ],
)
class $AppRouter {}
