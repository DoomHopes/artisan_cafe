import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../screens/main_screen.dart';
import '../../screens/custom_drink_screen.dart';
import '../../screens/brew_details_screen.dart';
import '../../screens/review_brew_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/register_screen.dart';
import '../../screens/splash_screen.dart';
import '../../providers/user_provider.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ValueNotifier<bool>(false);

  ref.listen(currentUserProvider, (previous, next) {
    notifier.value = !notifier.value;
  });

  ref.onDispose(() {
    notifier.dispose();
  });

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: notifier,
    redirect: (context, state) {
      final userState = ref.read(currentUserProvider);
      final isAuth = userState.value != null;
      final isLoggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/register';

      if (userState.isLoading) {
        return '/splash';
      }

      if (state.matchedLocation == '/splash') {
        return isAuth ? '/' : '/login';
      }

      if (!isAuth && !isLoggingIn) {
        return '/login';
      }

      if (isAuth && isLoggingIn) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/add_drink',
        builder: (context, state) => const CustomDrinkScreen(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) => const BrewDetailsScreen(),
          ),
          GoRoute(
            path: 'review',
            builder: (context, state) => const ReviewBrewScreen(),
          ),
        ],
      ),
    ],
  );
});
