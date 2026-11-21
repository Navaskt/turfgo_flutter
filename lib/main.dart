import 'package:material_ui/material_ui.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/di/injection.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';


void main() async{
   final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await configureDependencies();
  getIt<AppRouter>().initialize();
  runApp(ProviderScope(child: const MyApp()));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: getIt<AppRouter>().router,
    );
  }
  }