import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';
import 'app_router_paths.dart';

@singleton
class AppRouter {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigator => _navigatorKey;

  late final GoRouter _router;
  GoRouter get router => _router;

  void initialize() {
    _router = GoRouter(
      navigatorKey: _navigatorKey,
      routes: _buildRoutes(),
    );
  }

  void dispose() {
    _router.dispose();
  }

  List<GoRoute> _buildRoutes() {
    return [
      GoRoute(
        path: AppRouterPaths.home,
        builder: (context, state) => MyHomePage(title: 'Turf Screen'),
      ),
      GoRoute(
        path: AppRouterPaths.turf,
        builder: (context, state) {
          return Center(
            child: Text('Turf Screen'),
          );
        },
      ),
    ];
  }
}
