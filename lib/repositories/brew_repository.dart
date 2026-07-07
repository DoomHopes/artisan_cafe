import '../models/brew.dart';

abstract class BrewRepository {
  /// Получить список всех записей (кофе)
  Future<List<Brew>> getBrews();

  /// Получить конкретную запись по id (может вернуть null, если не найдена)
  Future<Brew?> getBrewById(String id);

  /// Добавить новую запись
  Future<void> addBrew(Brew brew);

  /// Удалить запись по её уникальному идентификатору (id)
  Future<void> deleteBrew(String id);
}
