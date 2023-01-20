import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../pages/login/login_page.dart';
import '../pages/message/message_page.dart';
import '../pages/root_page.dart';
import '../pages/sms_list/list_page.dart';
import 'auth_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
        guards: [AuthGuard],
        page: RootPage,
        path: '/',
        children: [
          AutoRoute(
            initial: true,
            path: 'inbox',
            name: 'InboxTab',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: ListPage),
              AutoRoute(
                path: ':name',
                page: MessagePage,
                fullscreenDialog: true,
              ),
            ],
          ),
          AutoRoute(
            path: 'outbox',
            name: 'OutboxTab',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: ListPage),
              AutoRoute(
                path: ':name',
                page: MessagePage,
                fullscreenDialog: true,
              ),
            ],
          ),
          AutoRoute(
            path: 'sent',
            name: 'SentTab',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: ListPage),
              AutoRoute(
                path: ':name',
                page: MessagePage,
                fullscreenDialog: true,
              ),
            ],
          ),
          AutoRoute(
            path: 'error',
            name: 'ErrorTab',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: ListPage),
              AutoRoute(
                path: ':name',
                page: MessagePage,
                fullscreenDialog: true,
              ),
            ],
          ),
        ]),
  ],
)
class $AppRouter {}
