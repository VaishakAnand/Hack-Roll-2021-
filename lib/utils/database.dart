import 'dart:async';
import 'dart:io';

import 'package:flutterapp/utils/data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
//    return await openDatabase(
//      join(await getDatabasesPath(), 'text_song_data.db'),
//      onCreate: (db, version) async {
//        await db.execute(
//          "CREATE TABLE data(id INTEGER PRIMARY KEY, datetime INTEGER, arousal INTEGER, valence INTEGER, keywords TEXT, songname TEXT, artistname TEXT, genre TEXT, releaseyear TEXT)",
//        );
//      },
//      version: 1,
//    );

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "text_song_data.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE data(id INTEGER PRIMARY KEY,"
            " datetime INTEGER, arousal INTEGER,"
            " valence INTEGER, keywords TEXT,"
            " songname TEXT, artistname TEXT,"
            " genre TEXT,"
            " releaseyear TEXT)",
      );
    });
  }

  Future<void> newData(Data newData) async {
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
        valenceScore: maps[i]['valence'],
        keywords: maps[i]['keywords'],
        songName: maps[i]['songname'],
        artistName: maps[i]['artistname'],
        genre: maps[i]['genre'],
        releaseYear: maps[i]['releaseyear'],
      );
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
