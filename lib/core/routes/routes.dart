import 'package:fruiteapp/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import 'kay_route.dart';

class Routes {
  GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: KayRoute.splash,
        builder: (context, state) {
          return const SplashView();
        },
      ),
    ],
  );
}
