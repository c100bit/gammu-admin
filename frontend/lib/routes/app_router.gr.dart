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

import '../pages/message/message_page.dart' as _i4;
import '../pages/root_page.dart' as _i1;
import '../pages/sms_list/list_page.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.RootPage(),
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
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ListPage(),
      );
    },
    MessageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessageRouteArgs>(
          orElse: () => MessageRouteArgs(name: pathParams.getString('name')));
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.MessagePage(
          key: args.key,
          name: args.name,
        ),
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          RootRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              InboxTab.name,
              path: 'inbox',
              parent: RootRoute.name,
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
              parent: RootRoute.name,
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
              parent: RootRoute.name,
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
              parent: RootRoute.name,
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
/// [_i1.RootPage]
class RootRoute extends _i5.PageRouteInfo<void> {
  const RootRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootRoute';
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
class ListRoute extends _i5.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i4.MessagePage]
class MessageRoute extends _i5.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    _i6.Key? key,
    required String name,
  }) : super(
          MessageRoute.name,
          path: ':name',
          args: MessageRouteArgs(
            key: key,
            name: name,
          ),
          rawPathParams: {'name': name},
        );

  static const String name = 'MessageRoute';
}

class MessageRouteArgs {
  const MessageRouteArgs({
    this.key,
    required this.name,
  });

  final _i6.Key? key;

  final String name;

  @override
  String toString() {
    return 'MessageRouteArgs{key: $key, name: $name}';
  }
}
