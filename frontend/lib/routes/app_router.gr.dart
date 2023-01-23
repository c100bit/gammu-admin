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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i8;

import '../pages/login/login_page.dart' as _i1;
import '../pages/message/message_page.dart' as _i6;
import '../pages/root_page.dart' as _i3;
import '../pages/send/send_page.dart' as _i2;
import '../pages/sms_list/list_page.dart' as _i5;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(
            child: _i1.LoginPage(
          key: args.key,
          onResult: args.onResult,
        )),
      );
    },
    SendRoute.name: (routeData) {
      final args =
          routeData.argsAs<SendRouteArgs>(orElse: () => const SendRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: _i2.SendPage(key: args.key)),
        fullscreenDialog: true,
      );
    },
    RootRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i3.RootPage()),
      );
    },
    InboxTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
        maintainState: false,
      );
    },
    OutboxTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
        maintainState: false,
      );
    },
    SentTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
        maintainState: false,
      );
    },
    ErrorTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
        maintainState: false,
      );
    },
    ListRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ListPage(),
      );
    },
    MessageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessageRouteArgs>(
          orElse: () => MessageRouteArgs(name: pathParams.getString('name')));
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MessagePage(
          key: args.key,
          name: args.name,
        ),
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i7.RouteConfig(
          SendRoute.name,
          path: '/send',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          RootRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            _i7.RouteConfig(
              '#redirect',
              path: '',
              parent: RootRoute.name,
              redirectTo: 'inbox',
              fullMatch: true,
            ),
            _i7.RouteConfig(
              InboxTab.name,
              path: 'inbox',
              parent: RootRoute.name,
              children: [
                _i7.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: InboxTab.name,
                ),
                _i7.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: InboxTab.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              OutboxTab.name,
              path: 'outbox',
              parent: RootRoute.name,
              children: [
                _i7.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: OutboxTab.name,
                ),
                _i7.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: OutboxTab.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              SentTab.name,
              path: 'sent',
              parent: RootRoute.name,
              children: [
                _i7.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: SentTab.name,
                ),
                _i7.RouteConfig(
                  MessageRoute.name,
                  path: ':name',
                  parent: SentTab.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              ErrorTab.name,
              path: 'error',
              parent: RootRoute.name,
              children: [
                _i7.RouteConfig(
                  ListRoute.name,
                  path: '',
                  parent: ErrorTab.name,
                ),
                _i7.RouteConfig(
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
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i8.Key? key,
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

  final _i8.Key? key;

  final void Function(bool) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.SendPage]
class SendRoute extends _i7.PageRouteInfo<SendRouteArgs> {
  SendRoute({_i8.Key? key})
      : super(
          SendRoute.name,
          path: '/send',
          args: SendRouteArgs(key: key),
        );

  static const String name = 'SendRoute';
}

class SendRouteArgs {
  const SendRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SendRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RootPage]
class RootRoute extends _i7.PageRouteInfo<void> {
  const RootRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class InboxTab extends _i7.PageRouteInfo<void> {
  const InboxTab({List<_i7.PageRouteInfo>? children})
      : super(
          InboxTab.name,
          path: 'inbox',
          initialChildren: children,
        );

  static const String name = 'InboxTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class OutboxTab extends _i7.PageRouteInfo<void> {
  const OutboxTab({List<_i7.PageRouteInfo>? children})
      : super(
          OutboxTab.name,
          path: 'outbox',
          initialChildren: children,
        );

  static const String name = 'OutboxTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class SentTab extends _i7.PageRouteInfo<void> {
  const SentTab({List<_i7.PageRouteInfo>? children})
      : super(
          SentTab.name,
          path: 'sent',
          initialChildren: children,
        );

  static const String name = 'SentTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ErrorTab extends _i7.PageRouteInfo<void> {
  const ErrorTab({List<_i7.PageRouteInfo>? children})
      : super(
          ErrorTab.name,
          path: 'error',
          initialChildren: children,
        );

  static const String name = 'ErrorTab';
}

/// generated route for
/// [_i5.ListPage]
class ListRoute extends _i7.PageRouteInfo<void> {
  const ListRoute()
      : super(
          ListRoute.name,
          path: '',
        );

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i6.MessagePage]
class MessageRoute extends _i7.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    _i8.Key? key,
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

  final _i8.Key? key;

  final String name;

  @override
  String toString() {
    return 'MessageRouteArgs{key: $key, name: $name}';
  }
}
