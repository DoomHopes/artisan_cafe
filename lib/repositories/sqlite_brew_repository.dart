import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/brew.dart';
import 'brew_repository.dart';

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
    final db = await database;
    final List<Map<String, Object?>> maps = await db.query(
      _tableName,
      orderBy: 'createdAt DESC',
    );

    return maps.map((map) => _dbMapToBrew(map)).toList();
  }

  @override
  Future<Brew?> getBrewById(String id) async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return _dbMapToBrew(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> addBrew(Brew brew) async {
    final db = await database;
    await db.insert(
      _tableName,
      _brewToDbMap(brew),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteBrew(String id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
