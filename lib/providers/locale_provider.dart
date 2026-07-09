import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'user_provider.dart';

part 'locale_provider.g.dart';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  static const _localeKey = 'app_locale';

  @override
  Future<Locale> build() async {
    final storage = ref.watch(secureStorageProvider);
    final savedCode = await storage.read(key: _localeKey);
    
    if (savedCode != null) {
      return Locale(savedCode);
    }
    return const Locale('en'); // Default fallback
  }

  Future<void> updateLanguage(String languageCode) async {
    final storage = ref.read(secureStorageProvider);
    await storage.write(key: _localeKey, value: languageCode);
    state = AsyncData(Locale(languageCode));

    // Update in database if logged in
    final currentUser = ref.read(currentUserProvider).value;
    if (currentUser != null) {
      await ref.read(currentUserProvider.notifier).updateLanguage(languageCode);
    }
  }

  Future<void> syncWithUser(String languageCode) async {
    final storage = ref.read(secureStorageProvider);
    await storage.write(key: _localeKey, value: languageCode);
    state = AsyncData(Locale(languageCode));
  }
}
