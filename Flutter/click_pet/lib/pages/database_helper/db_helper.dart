import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  DBHelper._internal();

  Future<void> initHive() async {
    await Hive.openBox('visits'); // Open visits table
    await Hive.openBox('pets'); // Open pets table
  }

  // Insert a visit record
  Future<void> insertVisit(Map<String, dynamic> data) async {
    var box = Hive.box('visits');
    await box.add(data);
  }

  // Get all visits
  List<Map<String, dynamic>> getVisits() {
    var box = Hive.box('visits');
    return box.values.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  // Update a visit
  Future<void> updateVisit(int index, Map<String, dynamic> data) async {
    var box = Hive.box('visits');
    await box.putAt(index, data);
  }

  // Insert a pet record
  Future<void> insertPet(Map<String, dynamic> data) async {
    var box = Hive.box('pets');
    await box.add(data);
  }

  // Get all pets
  List<Map<String, dynamic>> getPets() {
    var box = Hive.box('pets');
    return box.values.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
