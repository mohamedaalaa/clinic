


import 'package:clinic/model/patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../book_appointment.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({Key? key}) : super(key: key);

  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<AddPatient>(context,listen: false).fetchAndSetPatients(),
        builder: (context, snapshot) =>snapshot.connectionState==ConnectionState.waiting?
        const Center(child: CircularProgressIndicator(),)
            :
            Consumer<AddPatient>(builder: (context,addPatient,ch) =>addPatient.items.isEmpty
            ? const Center(
            child: Text(
              'No patients yet',
              style: TextStyle(fontSize: 20),
            ))
            :ListView.builder(
              itemCount: addPatient.items.length,
              itemBuilder: (context,i) {
                return ListTile(
                  leading: Text(addPatient.items[i].age),
                  title: Text(addPatient.items[i].name),
                  subtitle:  Text('${addPatient.items[i].phone}  ${addPatient.items[i].address}'),
                );
              },
            )
            )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        Navigator.of(context).push( MaterialPageRoute(builder: (context)=>const AddPatientData()));
      },),
    );
  }
}
