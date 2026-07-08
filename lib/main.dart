import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

import 'core/utils/logger.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        TalkerRiverpodObserver(talker: talker),
      ],
      child: const ArtisanCafeApp(),
    ),
  );
}

class ArtisanCafeApp extends ConsumerWidget {
  const ArtisanCafeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Artisan Cafe',
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
