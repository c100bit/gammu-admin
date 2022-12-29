import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../home_page.dart';
import '../pages/error_page.dart';
import '../pages/inbox_page.dart';
import '../pages/message_page.dart';
import '../pages/outbox_page.dart';
import '../pages/sent_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HomePage, path: '/', children: [
      AutoRoute(
        path: 'inbox',
        name: 'InboxRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: InboxPage,
          ),
          AutoRoute(
            path: ':name',
            page: MessagePage,
          ),
        ],
      ),
      AutoRoute(
        path: 'sent',
        page: SentPage,
        children: [
          AutoRoute(
            path: ':name',
            page: MessagePage,
          ),
        ],
      ),
      AutoRoute(
        path: 'error',
        page: ErrorPage,
        children: [
          AutoRoute(
            path: ':name',
            page: MessagePage,
          ),
        ],
      ),
      AutoRoute(
        path: 'outbox',
        page: OutboxPage,
        children: [
          AutoRoute(
            path: ':name',
            page: MessagePage,
          ),
        ],
      ),
    ]),
  ],
)
class $AppRouter {}
