import 'package:flutter/material.dart';
import './database_helper/db_helper.dart';

class PetsList extends StatefulWidget {
  @override
  _PetsListState createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  List<Map<String, dynamic>> _pets = [];

  void _loadVisits() {
    _pets = DBHelper().getPets();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadVisits();
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
