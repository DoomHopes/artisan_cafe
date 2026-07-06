import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/app_theme.dart';
import 'screens/main_screen.dart';
import 'screens/custom_drink_screen.dart';
import 'screens/brew_details_screen.dart';
import 'screens/review_brew_screen.dart';

void main() {
  runApp(const ArtisanCafeApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
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

class ArtisanCafeApp extends StatelessWidget {
  const ArtisanCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Artisan Cafe',
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
