// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i9;

import '../home_page.dart' as _i1;
import '../pages/error_page.dart' as _i4;
import '../pages/inbox_page.dart' as _i6;
import '../pages/message_page.dart' as _i7;
import '../pages/outbox_page.dart' as _i5;
import '../pages/sent_page.dart' as _i3;
import '../services/gammu_service/folder.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    InboxRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SentRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SentPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ErrorPage(),
      );
    },
    OutboxRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OutboxPage(),
      );
    },
    InboxRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.InboxPage(),
      );
    },
    MessageRoute.name: (routeData) {
      final args = routeData.argsAs<MessageRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.MessagePage(
          key: args.key,
          name: args.name,
          folder: args.folder,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i8.RouteConfig(
              InboxRouter.name,
              path: 'inbox',
              parent: HomeRoute.name,
              children: [
                _i8.RouteConfig(
                  InboxRoute.name,
                  path: '',
                  parent: InboxRouter.name,
                ),
                _i8.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: InboxRouter.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              SentRoute.name,
              path: 'sent',
              parent: HomeRoute.name,
              children: [
                _i8.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: SentRoute.name,
                )
              ],
            ),
            _i8.RouteConfig(
              ErrorRoute.name,
              path: 'error',
              parent: HomeRoute.name,
              children: [
                _i8.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: ErrorRoute.name,
                )
              ],
            ),
            _i8.RouteConfig(
              OutboxRoute.name,
              path: 'outbox',
              parent: HomeRoute.name,
              children: [
                _i8.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: OutboxRoute.name,
                )
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class InboxRouter extends _i8.PageRouteInfo<void> {
  const InboxRouter({List<_i8.PageRouteInfo>? children})
      : super(
          InboxRouter.name,
          path: 'inbox',
          initialChildren: children,
        );

  static const String name = 'InboxRouter';
}

/// generated route for
/// [_i3.SentPage]
class SentRoute extends _i8.PageRouteInfo<void> {
  const SentRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SentRoute.name,
          path: 'sent',
          initialChildren: children,
        );

  static const String name = 'SentRoute';
}

/// generated route for
/// [_i4.ErrorPage]
class ErrorRoute extends _i8.PageRouteInfo<void> {
  const ErrorRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ErrorRoute.name,
          path: 'error',
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';
}

/// generated route for
/// [_i5.OutboxPage]
class OutboxRoute extends _i8.PageRouteInfo<void> {
  const OutboxRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OutboxRoute.name,
          path: 'outbox',
          initialChildren: children,
        );

  static const String name = 'OutboxRoute';
}

/// generated route for
/// [_i6.InboxPage]
class InboxRoute extends _i8.PageRouteInfo<void> {
  const InboxRoute()
      : super(
          InboxRoute.name,
          path: '',
        );

  static const String name = 'InboxRoute';
}

/// generated route for
/// [_i7.MessagePage]
class MessageRoute extends _i8.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    _i9.Key? key,
    required String name,
    required _i10.Folder folder,
  }) : super(
          MessageRoute.name,
          path: ':name',
          args: MessageRouteArgs(
            key: key,
            name: name,
            folder: folder,
          ),
        );

  static const String name = 'MessageRoute';
}

class MessageRouteArgs {
  const MessageRouteArgs({
    this.key,
    required this.name,
    required this.folder,
  });

  final _i9.Key? key;

  final String name;

  final _i10.Folder folder;

  @override
  String toString() {
    return 'MessageRouteArgs{key: $key, name: $name, folder: $folder}';
  }
}
