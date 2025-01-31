import 'package:flutter/material.dart';
import './database_helper/db_helper.dart';

class AddPetForm extends StatefulWidget {
  @override
  _AddPetFormState createState() => _AddPetFormState();
}

class _AddPetFormState extends State<AddPetForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _petTypeController = TextEditingController();
  final TextEditingController _propertiesController = TextEditingController();

  void _savePet() async {
    try {
      if (_formKey.currentState!.validate()) {
        final db = DBHelper();
        await db.insertPet({
          'petType': _petTypeController.text,
          'properties': _propertiesController.text,
        });

        // Refresh UI after saving the pet
        setState(() {});

        // Close the popup after saving
        Navigator.pop(context);
      }
    } catch (e) {
      print("Error saving pet: $e"); // ✅ Debugging error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Pet"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
                controller: _petTypeController,
                decoration: InputDecoration(labelText: "Pet Type")),
            TextFormField(
                controller: _propertiesController,
                decoration: InputDecoration(labelText: "Properties")),
          ],
        ),
      ),
      actions: [ElevatedButton(onPressed: _savePet, child: Text("Save"))],
    );
  }
}
