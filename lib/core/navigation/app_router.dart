import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../features/explore/presentation/screens/explore_screen.dart';
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
        builder: (context, state) => const ExploreScreen(),
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
