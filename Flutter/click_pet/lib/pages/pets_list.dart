import 'package:flutter/material.dart';
import './database_helper/db_helper.dart';

class PetsList extends StatefulWidget {
  @override
  _PetsListState createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  List<Map<String, dynamic>> _pets = [];

  void _loadPets() async {
    final db = DBHelper();
    await db.database; // <-- Ensure DB is initialized before insert
    final pets = await db.getPets();
    setState(() {
      _pets = pets;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pets List")),
      body: ListView.builder(
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          final pet = _pets[index];
          return ListTile(
            title: Text(pet['petType']),
            subtitle: Text("Properties: ${pet['properties']}"),
          );
        },
      ),
    );
  }
}
