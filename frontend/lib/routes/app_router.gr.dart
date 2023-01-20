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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i7;

import '../pages/login/login_page.dart' as _i1;
import '../pages/message/message_page.dart' as _i5;
import '../pages/root_page.dart' as _i2;
import '../pages/sms_list/list_page.dart' as _i4;
import 'auth_guard.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter({
    _i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(
            child: _i1.LoginPage(
          key: args.key,
          onResult: args.onResult,
        )),
      );
    },
    RootRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RootPage(),
      );
    },
    InboxTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    OutboxTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    SentTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ErrorTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ListRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ListPage(),
      );
    },
    MessageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessageRouteArgs>(
          orElse: () => MessageRouteArgs(name: pathParams.getString('name')));
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.MessagePage(
          key: args.key,
          name: args.name,
        ),
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i6.RouteConfig(
          RootRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: RootRoute.name,
              redirectTo: 'inbox',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              InboxTab.name,
              path: 'inbox',
              parent: RootRoute.name,
              children: [
                _i6.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: InboxTab.name,
                ),
                _i6.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: InboxTab.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              OutboxTab.name,
              path: 'outbox',
              parent: RootRoute.name,
              children: [
                _i6.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: OutboxTab.name,
                ),
                _i6.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: OutboxTab.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              SentTab.name,
              path: 'sent',
              parent: RootRoute.name,
              children: [
                _i6.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: SentTab.name,
                ),
                _i6.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: SentTab.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              ErrorTab.name,
              path: 'error',
              parent: RootRoute.name,
              children: [
                _i6.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: ErrorTab.name,
                ),
                _i6.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: ErrorTab.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    required void Function(bool) onResult,
  }) : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final _i7.Key? key;

  final void Function(bool) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.RootPage]
class RootRoute extends _i6.PageRouteInfo<void> {
  const RootRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class InboxTab extends _i6.PageRouteInfo<void> {
  const InboxTab({List<_i6.PageRouteInfo>? children})
      : super(
          InboxTab.name,
          path: 'inbox',
          initialChildren: children,
        );

  static const String name = 'InboxTab';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class OutboxTab extends _i6.PageRouteInfo<void> {
  const OutboxTab({List<_i6.PageRouteInfo>? children})
      : super(
          OutboxTab.name,
          path: 'outbox',
          initialChildren: children,
        );

  static const String name = 'OutboxTab';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class SentTab extends _i6.PageRouteInfo<void> {
  const SentTab({List<_i6.PageRouteInfo>? children})
      : super(
          SentTab.name,
          path: 'sent',
          initialChildren: children,
        );

  static const String name = 'SentTab';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ErrorTab extends _i6.PageRouteInfo<void> {
  const ErrorTab({List<_i6.PageRouteInfo>? children})
      : super(
          ErrorTab.name,
          path: 'error',
          initialChildren: children,
        );

  static const String name = 'ErrorTab';
}

/// generated route for
/// [_i4.ListPage]
class ListRoute extends _i6.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i5.MessagePage]
class MessageRoute extends _i6.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    _i7.Key? key,
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

  final _i7.Key? key;

  final String name;

  @override
  String toString() {
    return 'MessageRouteArgs{key: $key, name: $name}';
  }
}
