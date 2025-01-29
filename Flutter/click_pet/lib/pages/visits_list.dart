import 'package:flutter/material.dart';
import './database_helper/db_helper.dart';
import 'visit_details.dart';

class VisitsList extends StatefulWidget {
  @override
  _VisitsListState createState() => _VisitsListState();
}

class _VisitsListState extends State<VisitsList> {
  List<Map<String, dynamic>> _visits = [];

  void _loadVisits() async {
    final db = DBHelper();
    await db.database; // <-- Ensure DB is initialized before insert
    final visits = await db.getVisits();
    setState(() {
      _visits = visits;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadVisits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Visits List")),
      body: ListView.builder(
        itemCount: _visits.length,
        itemBuilder: (context, index) {
          final visit = _visits[index];
          return ListTile(
            title: Text("${visit['petOwner']} - ${visit['petType']}"),
            subtitle: Text("Date: ${visit['visitDate']}"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VisitDetails(visit: visit)),
            ).then((_) => _loadVisits()),
          );
        },
      ),
    );
  }
}
