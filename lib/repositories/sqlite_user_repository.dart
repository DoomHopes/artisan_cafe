import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';
import 'user_repository.dart';
import '../core/utils/logger.dart';

class SqliteUserRepository implements UserRepository {
  static const String _tableName = 'users';
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onUpgrade: _upgradeDB,
      onCreate: _createDB,
    );
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    // For development, just recreate table
    await db.execute('DROP TABLE IF EXISTS $_tableName');
    await _createDB(db, newVersion);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id TEXT PRIMARY KEY,
        username TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        name TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        dailyGoal INTEGER NOT NULL,
        remindersEnabled INTEGER NOT NULL,
        languageCode TEXT NOT NULL
      )
    ''');
  }

  Map<String, dynamic> _userToDbMap(User user) {
    final map = user.toJson();
    map['remindersEnabled'] = user.remindersEnabled ? 1 : 0;
    return map;
  }

  User _dbMapToUser(Map<String, Object?> map) {
    final mutableMap = Map<String, dynamic>.from(map);
    mutableMap['remindersEnabled'] =
        (mutableMap['remindersEnabled'] as int) == 1;
    return User.fromJson(mutableMap);
  }

  @override
  Future<void> createUser(User user) async {
    talker.debug('SqliteUserRepository: Creating user ${user.id}');
    try {
      final db = await database;
      await db.insert(
        _tableName,
        _userToDbMap(user),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
      talker.info('SqliteUserRepository: User ${user.id} created successfully');
    } catch (e, st) {
      talker.handle(e, st, 'SqliteUserRepository: Failed to create user');
      rethrow;
    }
  }

  @override
  Future<User?> getUser(String id) async {
    final db = await database;
    final maps = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return _dbMapToUser(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<User?> getUserByUsernameAndPassword(
    String username,
    String password,
  ) async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (maps.isNotEmpty) {
      return _dbMapToUser(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateUser(User user) async {
    talker.debug('SqliteUserRepository: Updating user ${user.id}');
    try {
      final db = await database;
      await db.update(
        _tableName,
        _userToDbMap(user),
        where: 'id = ?',
        whereArgs: [user.id],
      );
      talker.info('SqliteUserRepository: User ${user.id} updated');
    } catch (e, st) {
      talker.handle(e, st, 'SqliteUserRepository: Failed to update user');
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    talker.debug('SqliteUserRepository: Deleting user $id');
    try {
      final db = await database;
      await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
      talker.info('SqliteUserRepository: User $id deleted');
    } catch (e, st) {
      talker.handle(e, st, 'SqliteUserRepository: Failed to delete user');
      rethrow;
    }
  }
}
