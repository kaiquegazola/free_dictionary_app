import 'package:free_dictionary/screens/screens.dart';
import 'package:go_router/go_router.dart';

import '../di/service_locator.dart';

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
    GoRoute(
      path: '/details/:word',
      builder: (context, state) => DetailsScreen(
        word: state.pathParameters['word']!,
        store: getIt(),
      ),
    ),
  ],
);
