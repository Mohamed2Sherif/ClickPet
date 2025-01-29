import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'vet_clinic.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
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
      },
    );
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
