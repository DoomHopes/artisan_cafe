import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/brew_repository.dart';
import '../repositories/sqlite_brew_repository.dart';

part 'repository_provider.g.dart';

@riverpod
BrewRepository brewRepository(Ref ref) {
  // Возвращаем реализацию SQLite, но как интерфейс BrewRepository
  return SqliteBrewRepository();
}
