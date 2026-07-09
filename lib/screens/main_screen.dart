import 'package:flutter/material.dart';
import 'package:artisan_cafe/core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'stats_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const StatsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: AppColors.outlineVariant.withValues(alpha: 0.5),
              blurRadius: 1,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColors.secondaryContainer,
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                );
              }
              return TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurfaceVariant,
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: AppColors.onSecondaryContainer,
                );
              }
              return const IconThemeData(color: AppColors.onSurfaceVariant);
            }),
          ),
          child: NavigationBar(
            height: 64,
            backgroundColor: AppColors.surface,
            elevation: 0,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: l10n.navHome,
              ),
              NavigationDestination(
                icon: const Icon(Icons.history_outlined),
                selectedIcon: const Icon(Icons.history),
                label: l10n.navHistory,
              ),
              NavigationDestination(
                icon: const Icon(Icons.bar_chart_outlined),
                selectedIcon: const Icon(Icons.bar_chart),
                label: l10n.navStats,
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: l10n.navProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
