import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF271310);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF3e2723);
  static const Color onPrimaryContainer = Color(0xFFae8d87);
  
  static const Color secondary = Color(0xFF655d4f);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFeadecc);
  static const Color onSecondaryContainer = Color(0xFF6a6253);

  static const Color tertiary = Color(0xFF360700);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF5a1200);
  static const Color onTertiaryContainer = Color(0xFFff5f31);
  static const Color onTertiaryFixedVariant = Color(0xFF872000);

  static const Color error = Color(0xFFba1a1a);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFffdad6);
  static const Color onErrorContainer = Color(0xFF93000a);

  static const Color background = Color(0xFFfff8f6);
  static const Color onBackground = Color(0xFF2e150b);
  static const Color surface = Color(0xFFfff8f6);
  static const Color onSurface = Color(0xFF2e150b);
  static const Color surfaceVariant = Color(0xFFffdbcf);
  static const Color onSurfaceVariant = Color(0xFF504442);
  
  static const Color outline = Color(0xFF827472);
  static const Color outlineVariant = Color(0xFFd3c3c0);

  static const Color inverseSurface = Color(0xFF46291e);
  static const Color inverseOnSurface = Color(0xFFffede7);
  static const Color inversePrimary = Color(0xFFe3beb8);

  static const Color surfaceContainerHighest = Color(0xFFffdbcf);
  static const Color surfaceContainerHigh = Color(0xFFffe2d9);
  static const Color surfaceContainer = Color(0xFFffe9e3);
  static const Color surfaceContainerLow = Color(0xFFfff1ec);
  static const Color surfaceContainerLowest = Color(0xFFffffff);

  static const Color primaryFixedDim = Color(0xFFe3beb8);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    inversePrimary: inversePrimary,
  );
}
