import 'package:fruiteapp/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/Auth/presentation/views/login_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import 'kay_route.dart';

abstract class Routes {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: KayRoute.splash,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: KayRoute.onboarding,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: KayRoute.login,
        builder: (context, state) {
          return const LoginView();
        },
      ),

    ],
  );
}
