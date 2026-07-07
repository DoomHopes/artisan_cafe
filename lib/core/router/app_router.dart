import 'package:go_router/go_router.dart';
import '../../screens/main_screen.dart';
import '../../screens/custom_drink_screen.dart';
import '../../screens/brew_details_screen.dart';
import '../../screens/review_brew_screen.dart';

final GoRouter appRouter = GoRouter(
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
