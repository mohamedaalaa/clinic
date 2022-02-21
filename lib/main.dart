import 'package:clinic/model/assessment.dart';
import 'package:clinic/model/patient.dart';
import 'package:clinic/model/procedures.dart';
import 'package:clinic/model/visit.dart';
import 'package:clinic/screens/add_appointment.dart';
import 'package:clinic/screens/patients_list_screen.dart';
import 'package:clinic/screens/procedures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'book_appointment.dart';
import 'screens/doctors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*ChangeNotifierProvider(
        create:(context)=>AddPatient()),*/
        MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddPatient()),
        ChangeNotifierProvider(create: (context) => BookVisit()),
        ChangeNotifierProvider(create: (context) => AddAssessment1()),
        ChangeNotifierProvider(create: (context) => AddProcedure1())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: DashBoard(),
      ),
    );
  }
}

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PatientsList()));
                },
                child: const Text('patients')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddAppointment()));
                },
                child: const Text('book Appointment')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Doctor()));
                },
                child: const Text('Doctors')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrceduresScreen()));
                },
                child: const Text('Procedures')),
          ],
        ),
      ),
    );
  }
}
