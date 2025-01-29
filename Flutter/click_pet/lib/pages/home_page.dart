import 'package:flutter/material.dart';
import 'visits_list.dart';
import 'pets_list.dart';
import 'new_visit_form.dart';
import 'add_pet_form.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veterinary Clinic"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () =>
                  showDialog(context: context, builder: (_) => NewVisitForm()),
              child: Text("New Visit"),
            ),
            ElevatedButton(
              onPressed: () =>
                  showDialog(context: context, builder: (_) => AddPetForm()),
              child: Text("Add Pet"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => VisitsList())),
              child: Text("Visits List"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PetsList())),
              child: Text("Pet List"),
            ),
          ],
        ),
      ),
    );
  }
}
