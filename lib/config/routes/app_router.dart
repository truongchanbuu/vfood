import 'package:go_router/go_router.dart';

import '../../features/shared/presentations/pages/app_view.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const AppView(),
      ),
    ],
  );
}
