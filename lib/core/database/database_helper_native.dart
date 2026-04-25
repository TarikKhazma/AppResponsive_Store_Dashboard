import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../features/products/data/products_data.dart';
import '../../features/products/models/product_model.dart';

// Native (Android, iOS, Windows, Linux, macOS) implementation using sqflite
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  DatabaseHelper._();

  static Database? _db;

  Future<Database> get _database async {
    _db ??= await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'store.db');
    return openDatabase(path, version: 1, onCreate: _seed);
  }

  Future<void> _seed(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items(
        id       INTEGER PRIMARY KEY AUTOINCREMENT,
        name     TEXT    NOT NULL,
        category TEXT    NOT NULL,
        price    REAL    NOT NULL,
        imageUrl TEXT    NOT NULL
      )
    ''');
    final batch = db.batch();
    for (final p in mockProducts) {
      batch.insert('items', {
        'name': p.name,
        'category': p.category,
        'price': p.price,
        'imageUrl': p.imageUrl,
      });
    }
    await batch.commit(noResult: true);
  }

  Future<List<ProductModel>> getAllItems() async {
    final db = await _database;
    final maps = await db.query('items');
    return maps.map(ProductModel.fromMap).toList();
  }

  Future<int> insertItem(ProductModel item) async {
    final db = await _database;
    return db.insert('items', item.toMap());
  }

  Future<int> updateItem(ProductModel item) async {
    final db = await _database;
    return db.update('items', item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<int> deleteItem(String id) async {
    final db = await _database;
    return db.delete('items', where: 'id = ?', whereArgs: [id]);
  }
}
