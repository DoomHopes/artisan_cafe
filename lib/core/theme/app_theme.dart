import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final baseTextTheme = GoogleFonts.beVietnamProTextTheme();
    final literataTextTheme = GoogleFonts.literataTextTheme();

    return ThemeData(
      colorScheme: AppColors.lightColorScheme,
      scaffoldBackgroundColor: AppColors.background,
      useMaterial3: true,
      textTheme: baseTextTheme.copyWith(
        displayLarge: literataTextTheme.displayLarge?.copyWith(fontWeight: FontWeight.w700),
        displayMedium: literataTextTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600),
        displaySmall: literataTextTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
        headlineLarge: literataTextTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
        headlineMedium: literataTextTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
        headlineSmall: literataTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
        titleLarge: baseTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        titleMedium: baseTextTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        titleSmall: baseTextTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 18, height: 1.55),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16, height: 1.5),
        labelLarge: baseTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.28),
        labelMedium: baseTextTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
        labelSmall: baseTextTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500, fontSize: 11),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.onSecondaryContainer,
        unselectedItemColor: AppColors.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryContainer,
        foregroundColor: AppColors.onPrimary,
        elevation: 4,
      ),
    );
  }
}
