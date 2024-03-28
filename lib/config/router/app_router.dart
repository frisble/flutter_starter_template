import 'package:flutter/widgets.dart';
import 'package:flutter_starter_template/config/router/app_route.dart';
import 'package:flutter_starter_template/features/error/presentation/presentation_screen.dart';
import 'package:flutter_starter_template/features/home/presentation/home_screen.dart';
import 'package:flutter_starter_template/features/settings/presentation/settings_screen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.home.path,
    redirect: (context, state) {
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: AppRoute.settings.name,
        path: AppRoute.settings.path,
        builder: (context, state) => const SettingsScreen(),
      )
    ],
  );
}
