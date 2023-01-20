import 'package:auto_route/auto_route.dart';
import 'package:frontend/services/gammu_service.dart';

import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final GammuService gammuService;

  AuthGuard({
    required this.gammuService,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (gammuService.isAuthenticated) {
      resolver.next(true);
    } else {
      router.replaceAll([
        LoginRoute(onResult: (success) {
          router.removeLast();
          resolver.next(success);
        }),
      ]);
    }
  }
}
