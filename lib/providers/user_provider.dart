import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../models/user.dart';
import '../repositories/user_repository.dart';
import '../repositories/sqlite_user_repository.dart';
import '../core/utils/logger.dart';
import 'locale_provider.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return SqliteUserRepository();
}

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  static const _userIdKey = 'current_user_id';

  @override
  Future<User?> build() async {
    final storage = ref.watch(secureStorageProvider);
    final repo = ref.watch(userRepositoryProvider);
    
    final userId = await storage.read(key: _userIdKey);
    if (userId != null) {
      return await repo.getUser(userId);
    }
    return null;
  }

  Future<void> login(String username, String password) async {
    talker.debug('CurrentUser: Attempting login for $username');
    final repo = ref.read(userRepositoryProvider);
    final storage = ref.read(secureStorageProvider);
    
    final user = await repo.getUserByUsernameAndPassword(username, password);
    if (user != null) {
      await storage.write(key: _userIdKey, value: user.id);
      state = AsyncData(user);
      
      // Sync language
      await ref.read(localeProvider.notifier).syncWithUser(user.languageCode);

      talker.info('CurrentUser: Login successful for $username');
    } else {
      talker.warning('CurrentUser: Login failed for $username');
      throw Exception('Invalid username or password');
    }
  }

  Future<void> register(String username, String password) async {
    talker.debug('CurrentUser: Attempting registration for $username');
    final repo = ref.read(userRepositoryProvider);
    final storage = ref.read(secureStorageProvider);
    // Get current device language to set for the new user
    final currentLocale = ref.read(localeProvider).value?.languageCode ?? 'en';
    final newUser = User(
      id: const Uuid().v4(),
      username: username,
      password: password,
      name: 'Brewer_${const Uuid().v4().substring(0, 5)}',
      createdAt: DateTime.now(),
      dailyGoal: 3,
      remindersEnabled: true,
      languageCode: currentLocale,
    );
    
    try {
      await repo.createUser(newUser);
      talker.info('CurrentUser: Registration successful for $username');
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        talker.warning('CurrentUser: Registration failed - username $username already exists');
        throw Exception('Username already exists. Please choose a different one.');
      }
      talker.error('CurrentUser: Registration failed', e);
      rethrow;
    }
    await storage.write(key: _userIdKey, value: newUser.id);
    state = AsyncData(newUser);
  }

  Future<void> logout() async {
    talker.debug('CurrentUser: Logging out');
    final storage = ref.read(secureStorageProvider);
    await storage.delete(key: _userIdKey);
    state = const AsyncData(null);
    talker.info('CurrentUser: Logged out successfully');
  }

  Future<void> updateName(String newName) async {
    if (state.value == null) return;
    
    final updatedUser = state.value!.copyWith(name: newName);
    await ref.read(userRepositoryProvider).updateUser(updatedUser);
    state = AsyncData(updatedUser);
  }

  Future<void> updateDailyGoal(int newGoal) async {
    if (state.value == null) return;
    
    final updatedUser = state.value!.copyWith(dailyGoal: newGoal);
    await ref.read(userRepositoryProvider).updateUser(updatedUser);
    state = AsyncData(updatedUser);
  }

  Future<void> toggleReminders(bool enabled) async {
    if (state.value == null) return;
    
    final updatedUser = state.value!.copyWith(remindersEnabled: enabled);
    await ref.read(userRepositoryProvider).updateUser(updatedUser);
    state = AsyncData(updatedUser);
  }

  Future<void> updateLanguage(String languageCode) async {
    if (state.value == null) return;
    
    final updatedUser = state.value!.copyWith(languageCode: languageCode);
    await ref.read(userRepositoryProvider).updateUser(updatedUser);
    state = AsyncData(updatedUser);
  }
}
