import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/brew.dart';
import 'brew_repository.dart';
import '../core/utils/logger.dart';

class SqliteBrewRepository implements BrewRepository {
  static const String _tableName = 'brews';
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('brews.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        strength INTEGER NOT NULL,
        volume TEXT NOT NULL,
        isMilkBased INTEGER NOT NULL,
        origin TEXT NOT NULL,
        roastLevel TEXT NOT NULL,
        brewMethod TEXT NOT NULL,
        caffeine INTEGER NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  Map<String, dynamic> _brewToDbMap(Brew brew) {
    final map = brew.toJson();
    // sqflite doesn't support booleans natively, map to 0/1
    map['isMilkBased'] = brew.isMilkBased ? 1 : 0;
    return map;
  }

  Brew _dbMapToBrew(Map<String, Object?> map) {
    final mutableMap = Map<String, dynamic>.from(map);
    // map 0/1 back to boolean for json deserialization
    mutableMap['isMilkBased'] = (mutableMap['isMilkBased'] as int) == 1;
    return Brew.fromJson(mutableMap);
  }

  @override
  Future<List<Brew>> getBrews() async {
    talker.debug('SqliteBrewRepository: Fetching all brews');
    try {
      final db = await database;
      final List<Map<String, Object?>> maps = await db.query(
        _tableName,
        orderBy: 'createdAt DESC',
      );
      talker.info('SqliteBrewRepository: Fetched ${maps.length} brews');
      return maps.map((map) => _dbMapToBrew(map)).toList();
    } catch (e, st) {
      talker.handle(e, st, 'SqliteBrewRepository: Failed to fetch brews');
      rethrow;
    }
  }

  @override
  Future<Brew?> getBrewById(String id) async {
    talker.debug('SqliteBrewRepository: Fetching brew $id');
    try {
      final db = await database;
      final maps = await db.query(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        talker.info('SqliteBrewRepository: Brew $id found');
        return _dbMapToBrew(maps.first);
      } else {
        talker.info('SqliteBrewRepository: Brew $id not found');
        return null;
      }
    } catch (e, st) {
      talker.handle(e, st, 'SqliteBrewRepository: Failed to fetch brew $id');
      rethrow;
    }
  }

  @override
  Future<void> addBrew(Brew brew) async {
    talker.debug('SqliteBrewRepository: Adding brew ${brew.id}');
    try {
      final db = await database;
      await db.insert(
        _tableName,
        _brewToDbMap(brew),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      talker.info('SqliteBrewRepository: Brew ${brew.id} added successfully');
    } catch (e, st) {
      talker.handle(e, st, 'SqliteBrewRepository: Failed to add brew');
      rethrow;
    }
  }

  @override
  Future<void> deleteBrew(String id) async {
    talker.debug('SqliteBrewRepository: Deleting brew $id');
    try {
      final db = await database;
      await db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      talker.info('SqliteBrewRepository: Brew $id deleted');
    } catch (e, st) {
      talker.handle(e, st, 'SqliteBrewRepository: Failed to delete brew');
      rethrow;
    }
  }
}
