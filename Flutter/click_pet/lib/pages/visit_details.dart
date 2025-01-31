import 'package:flutter/material.dart';
import './database_helper/db_helper.dart';

class VisitDetails extends StatefulWidget {
  final Map<String, dynamic> visit;
  VisitDetails({required this.visit});

  @override
  _VisitDetailsState createState() => _VisitDetailsState();
}

class _VisitDetailsState extends State<VisitDetails> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _ownerController;
  late TextEditingController _phoneController;
  late TextEditingController _petTypeController;
  late TextEditingController _petAgeController;
  late TextEditingController _diseaseController;
  late TextEditingController _medicineController;
  late TextEditingController _dosageController;
  late TextEditingController _nextVisitController;

  @override
  void initState() {
    super.initState();
    _ownerController = TextEditingController(text: widget.visit['petOwner']);
    _phoneController = TextEditingController(text: widget.visit['phoneNum']);
    _petTypeController = TextEditingController(text: widget.visit['petType']);
    _petAgeController =
        TextEditingController(text: widget.visit['petAge'].toString());
    _diseaseController = TextEditingController(text: widget.visit['disease']);
    _medicineController = TextEditingController(text: widget.visit['medicine']);
    _dosageController = TextEditingController(text: widget.visit['dosage']);
    _nextVisitController =
        TextEditingController(text: widget.visit['nextVisitDate']);
  }

  void _updateVisit() async {
    if (_formKey.currentState!.validate()) {
      final db = DBHelper();
      await db.updateVisit(widget.visit['id'], {
        'petOwner': _ownerController.text,
        'phoneNum': _phoneController.text,
        'petType': _petTypeController.text,
        'petAge': int.parse(_petAgeController.text),
        'disease': _diseaseController.text,
        'medicine': _medicineController.text,
        'dosage': _dosageController.text,
        'nextVisitDate': _nextVisitController.text,
      });
      setState(() {});
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Visit Details")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
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
                  controller: _nextVisitController,
                  decoration: InputDecoration(labelText: "Next Visit Date")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _updateVisit, child: Text("Update Visit")),
            ],
          ),
        ),
      ),
    );
  }
}
