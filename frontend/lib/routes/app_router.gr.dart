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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i6;

import '../pages/home_page.dart' as _i1;
import '../pages/list_page/list_page.dart' as _i3;
import '../pages/message_page.dart' as _i4;
import '../services/gammu_service/folder.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    InboxTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    OutboxTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SentTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ErrorTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ListRoute.name: (routeData) {
      final args =
          routeData.argsAs<ListRouteArgs>(orElse: () => const ListRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ListPage(key: args.key),
      );
    },
    MessageRoute.name: (routeData) {
      final args = routeData.argsAs<MessageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.MessagePage(
          key: args.key,
          name: args.name,
          folder: args.folder,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              InboxTab.name,
              path: 'inbox',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: InboxTab.name,
                ),
                _i5.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: InboxTab.name,
                ),
              ],
            ),
            _i5.RouteConfig(
              OutboxTab.name,
              path: 'outbox',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: OutboxTab.name,
                ),
                _i5.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: OutboxTab.name,
                ),
              ],
            ),
            _i5.RouteConfig(
              SentTab.name,
              path: 'sent',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: SentTab.name,
                ),
                _i5.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: SentTab.name,
                ),
              ],
            ),
            _i5.RouteConfig(
              ErrorTab.name,
              path: 'error',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: ErrorTab.name,
                ),
                _i5.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: ErrorTab.name,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class InboxTab extends _i5.PageRouteInfo<void> {
  const InboxTab({List<_i5.PageRouteInfo>? children})
      : super(
          InboxTab.name,
          path: 'inbox',
          initialChildren: children,
        );

  static const String name = 'InboxTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class OutboxTab extends _i5.PageRouteInfo<void> {
  const OutboxTab({List<_i5.PageRouteInfo>? children})
      : super(
          OutboxTab.name,
          path: 'outbox',
          initialChildren: children,
        );

  static const String name = 'OutboxTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SentTab extends _i5.PageRouteInfo<void> {
  const SentTab({List<_i5.PageRouteInfo>? children})
      : super(
          SentTab.name,
          path: 'sent',
          initialChildren: children,
        );

  static const String name = 'SentTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ErrorTab extends _i5.PageRouteInfo<void> {
  const ErrorTab({List<_i5.PageRouteInfo>? children})
      : super(
          ErrorTab.name,
          path: 'error',
          initialChildren: children,
        );

  static const String name = 'ErrorTab';
}

/// generated route for
/// [_i3.ListPage]
class ListRoute extends _i5.PageRouteInfo<ListRouteArgs> {
  ListRoute({_i6.Key? key})
      : super(
          ListRoute.name,
          path: '',
          args: ListRouteArgs(key: key),
        );

  static const String name = 'ListRoute';
}

class ListRouteArgs {
  const ListRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'ListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.MessagePage]
class MessageRoute extends _i5.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    _i6.Key? key,
    required String name,
    required _i7.Folder folder,
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

  final _i6.Key? key;

  final String name;

  final _i7.Folder folder;

  @override
  String toString() {
    return 'MessageRouteArgs{key: $key, name: $name, folder: $folder}';
  }
}
