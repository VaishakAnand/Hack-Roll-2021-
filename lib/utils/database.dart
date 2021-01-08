import 'dart:async';

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
      'text_song_data',
      newData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
