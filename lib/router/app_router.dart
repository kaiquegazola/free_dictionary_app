import 'package:go_router/go_router.dart';

import '../di/service_locator.dart';
import '../screens/main/main_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(
        mainStore: getIt(),
        homeStore: getIt(),
        historyStore: getIt(),
        favoritesStore: getIt(),
      ),
    ),
  ],
);
