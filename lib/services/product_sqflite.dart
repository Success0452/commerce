import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('favorites.db');
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

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE favorites ( 
      id $idType, 
      title $textType,
      price $textType,
      description $textType,
      images $textType,
      creationAt $textType,
      updatedAt $textType,
      category $textType
      )
    ''');
  }

  Future<void> addFavorite(ProductModel product) async {
    final db = await instance.database;

    await db.insert(
      'favorites',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProductModel>> getFavorites() async {
    final db = await instance.database;

    final result = await db.query('favorites');

    return result.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<void> removeFavorite(int id) async {
    final db = await instance.database;

    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
