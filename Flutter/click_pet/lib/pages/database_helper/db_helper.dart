import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  factory DBHelper() {
    return _instance;
  }

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<bool> _dbExists(String path) async {
    return await File(path).exists();
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'vet_clinic.db');
    print(path);
    if (!await _dbExists(path)) {
      print("Database does not exist, creating new database...");
    } else {
      print("Database already exists.");
    }

    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print("Creating tables...");
        await _createTables(db);
      },
    );

    await _checkAndCreateTables(db);

    return db;
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE visits (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        petOwner TEXT,
        phoneNum TEXT,
        petType TEXT,
        petAge INTEGER,
        disease TEXT,
        medicine TEXT,
        dosage TEXT,
        nextVisitDate TEXT,
        visitDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE pets (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        petType TEXT,
        properties TEXT
      )
    ''');
  }

  Future<void> _checkAndCreateTables(Database db) async {
    List<Map<String, dynamic>> tables =
        await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");

    List<String> tableNames =
        tables.map((table) => table['name'] as String).toList();

    if (!tableNames.contains('visits')) {
      print("Creating 'visits' table...");
      await db.execute('''
        CREATE TABLE visits (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          petOwner TEXT,
          phoneNum TEXT,
          petType TEXT,
          petAge INTEGER,
          disease TEXT,
          medicine TEXT,
          dosage TEXT,
          nextVisitDate TEXT,
          visitDate TEXT
        )
      ''');
    }

    if (!tableNames.contains('pets')) {
      print("Creating 'pets' table...");
      await db.execute('''
        CREATE TABLE pets (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          petType TEXT,
          properties TEXT
        )
      ''');
    }
  }

  Future<int> insertVisit(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('visits', data);
  }

  Future<List<Map<String, dynamic>>> getVisits() async {
    final db = await database;
    return await db.query('visits', orderBy: 'visitDate DESC');
  }

  Future<int> updateVisit(int id, Map<String, dynamic> data) async {
    final db = await database;
    return await db.update('visits', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertPet(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('pets', data);
  }

  Future<List<Map<String, dynamic>>> getPets() async {
    final db = await database;
    return await db.query('pets');
  }
}
