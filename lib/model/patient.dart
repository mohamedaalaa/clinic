import 'package:clinic/helpers/db_helper.dart';
import 'package:flutter/cupertino.dart';

class Patient {
  final String id;
  final String name;
  final String age;
  final String address;
  final String phone;

  Patient(
      {required this.id,
      required this.name,
      required this.age,
      required this.address,
      required this.phone});
}

class AddPatient extends ChangeNotifier {
  List<Patient> _items = [];

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
  }
}
