import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../models/product_models.dart';

class SqfliteDb {
  static final SqfliteDb _dataDb = SqfliteDb._internal();
  Database? _database;

  // ignore: constant_identifier_names
  static const _NAMETABLE = 'ListProduct';

  factory SqfliteDb() {
    return _dataDb;
  }

  SqfliteDb._internal();

  get db async {
    if (_database != null) {
      return _database;
    } else {
      return _database = await _inicialixaDB();
    }
  }

  _inicialixaDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'listProduct.db');
    var db = await openDatabase(path,
        version: 2,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);
    return db;
  }

  _onCreate(Database db, int version) async {
    String sql = """CREATE TABLE $_NAMETABLE(
        id INTEGER PRIMARY KEY AUTOINCREMENT,      
        name VARCHAR NOT NULL,
        barcode VARCHAR NOT NULL,
        date VARCHAR NOT NULL,
        option VARCHAR NOT NULL,
        amount VARCHAR,
        description VARCHAR,
        isDowngrade VARCHAR DEFAULT 'false'
        );""";
    await db.execute(sql);
  }

  _onUpgrade(Database db, int oldVersion, int version) async {
    if (oldVersion == 1) {
      String sql = """ ALTER TABLE $_NAMETABLE
      ADD isDowngrade VARCHAR DEFAULT 'false'
        ;""";
      await db.execute(sql);
    }
  }

  _onDowngrade(Database db, int oldVersion, int version) async {
    // String sql = """ ALTER TABLE $_NAMETABLE
    // DROP COLUMN isDowngrade
    // ;""";
    // await db.execute(sql);
  }

  Future<void> create({required ProductModels productModels}) async {
    var sql = await db;
    try {
      await sql.insert(_NAMETABLE, productModels.toMap());
    } on Exception {
      rethrow;
    }
  }

  Future<List<Map>> get({required String option}) async {
    var sql = await db;
    try {
      var result = await sql.rawQuery(
          "SELECT * FROM $_NAMETABLE WHERE option = '$option' ORDER BY date ASC");
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map>> search({required String barcode}) async {
    var sql = await db;
    try {
      var result = await sql.rawQuery(
          "SELECT * FROM $_NAMETABLE WHERE barcode = '$barcode' ORDER BY date ASC");
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update({required ProductModels productModels}) async {
    var sql = await db;
    try {
      final result = await sql.update(_NAMETABLE, productModels.toMap(),
          where: "id = ?", whereArgs: [productModels.id]);
      return result;
    } on Exception {
      rethrow;
    }
  }

  Future<void> delete({required int id}) async {
    var sql = await db;
    try {
      final result =
          await sql.delete(_NAMETABLE, where: 'id = ?', whereArgs: [id]);
      return result;
    } on Exception {
      rethrow;
    }
  }
}
