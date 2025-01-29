import 'package:flutter/material.dart';
import './database_helper/db_helper.dart';
import 'package:intl/intl.dart';

class NewVisitForm extends StatefulWidget {
  @override
  _NewVisitFormState createState() => _NewVisitFormState();
}

class _NewVisitFormState extends State<NewVisitForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ownerController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _petTypeController = TextEditingController();
  final TextEditingController _petAgeController = TextEditingController();
  final TextEditingController _diseaseController = TextEditingController();
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _nextVisitDaysController =
      TextEditingController();

  void _saveVisit() async {
    if (_formKey.currentState!.validate()) {
      final db = DBHelper();
      await db.database; // <-- Ensure DB is initialized before insert

      DateTime now = DateTime.now();
      DateTime nextVisit =
          now.add(Duration(days: int.parse(_nextVisitDaysController.text)));

      await db.insertVisit({
        'petOwner': _ownerController.text,
        'phoneNum': _phoneController.text,
        'petType': _petTypeController.text,
        'petAge': int.parse(_petAgeController.text),
        'disease': _diseaseController.text,
        'medicine': _medicineController.text,
        'dosage': _dosageController.text,
        'nextVisitDate': nextVisit.toIso8601String(),
        'visitDate': now.toIso8601String(),
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("New Visit"),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  controller: _ownerController,
                  decoration: InputDecoration(labelText: "Pet Owner")),
              TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: "Phone Number")),
              TextFormField(
                  controller: _petTypeController,
                  decoration: InputDecoration(labelText: "Pet Type")),
              TextFormField(
                  controller: _petAgeController,
                  decoration: InputDecoration(labelText: "Pet Age")),
              TextFormField(
                  controller: _diseaseController,
                  decoration: InputDecoration(labelText: "Disease")),
              TextFormField(
                  controller: _medicineController,
                  decoration: InputDecoration(labelText: "Medicine")),
              TextFormField(
                  controller: _dosageController,
                  decoration: InputDecoration(labelText: "Dosage")),
              TextFormField(
                  controller: _nextVisitDaysController,
                  decoration: InputDecoration(labelText: "Next Visit (Days)")),
            ],
          ),
        ),
      ),
      actions: [ElevatedButton(onPressed: _saveVisit, child: Text("Save"))],
    );
  }
}
