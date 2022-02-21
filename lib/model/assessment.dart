import 'package:clinic/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class Assessment {
  final String id;
  final String diagonis;
  final String prescription;
  final String lab;
  final String price;

  Assessment(
      {required this.id,
      required this.diagonis,
      required this.prescription,
      required this.lab,
      required this.price});
}

class AddAssessment1 extends ChangeNotifier {
  List<Assessment> _items = [];

  List<Assessment> get items {
    return _items;
  }

  void addAssessment(
      final String diagonis, final String prescription, final String lab,String price) {
    final assessment = Assessment(
        id: DateTime.now().toString(),
        diagonis: diagonis,
        prescription: prescription,
        lab: lab,
        price: price
    );
    _items.add(assessment);
    notifyListeners();
    DBHelper.insertAssessment('assessment', {
    'id': assessment.id,
      'diagonis': assessment.diagonis,
      'prescription' : assessment.prescription,
      'lab' : assessment.lab,
      'price' : assessment.price
    });
  }

  Future<void> fetchAndSetAssessment() async {
    final dataList = await DBHelper.getAssessmentData('assessment');
    final assessments = dataList
        .map((e) => Assessment(
            id: e['id'],
            diagonis: e['diagonis'],
            prescription: e['prescription'],
            lab: e['lab'],
            price: e['price']
    ))
        .toList();
    notifyListeners();

  }

  /*List<Patient> _items = [];

  List<Patient> get items {
    return _items;
  }

  void addPlatient(String name, String address, String age, String phone) {
    final newPatient = Patient(
        name: name,
        age: age,
        address: address,
        phone: phone,
        id: DateTime.now().toString());
    _items.add(newPatient);
    notifyListeners();
    DBHelper.insertPatients('patients', {
      'id': newPatient.id,
      'name': newPatient.name,
      'age': newPatient.age.toString(),
      'address': newPatient.address,
      'phone': newPatient.phone
    });
  }

  Future<void> fetchAndSetPatients() async {
    final dataList = await DBHelper.getPatientsData('patients');
    final patients = dataList
        .map((e) => Patient(
            id: e['id'],
            name: e['name'],
            age: e['age'],
            address: e['address'],
            phone: e['phone']))
        .toList();
    notifyListeners();
  }*/
}
