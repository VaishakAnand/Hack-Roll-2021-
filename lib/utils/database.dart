import 'dart:async';

import 'package:flutterapp/utils/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return null;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'text_song_data.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE data(id INTEGER PRIMARY KEY, datetime INTEGER, arousal INTEGER, valence INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> newData(newData) async {
    final Database db = await database;

    await db.insert(
      'data',
      newData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Data>> getAllData() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('data');

    return List.generate(maps.length, (i) {
      return Data(
          id: maps[i]['id'],
          dateTime: maps[i]['datetime'],
          arousalScore: maps[i]['arousal'],
          valenceScore: maps[i]['valence']);
    });
  }

  Future<void> updateData(Data data) async {
    final db = await database;

    await db.update(
      'data',
      data.toMap(),
      where: "id = ?",
      whereArgs: [data.id],
    );
  }

  Future<void> deleteData(int id) async {
    final db = await database;

    await db.delete(
      'data',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
