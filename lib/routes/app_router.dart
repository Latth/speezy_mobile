import 'package:go_router/go_router.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../views/login/login.dart';
import '../views/splash/splash.dart';

GoRouter createRouter(AuthViewModel authViewModel) {
  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: authViewModel,
    redirect: (context, state) {
      final isLoggedIn = authViewModel.isLoggedIn;
      final loggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !loggingIn) return '/login';
      if (isLoggedIn && loggingIn) return '/home';

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
