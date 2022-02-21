

import 'package:clinic/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class Procedures{
  final String id;
  final String procedures;

  Procedures({required this.id,required this.procedures});
}



class AddProcedure1 extends ChangeNotifier{
  List<Procedures> _items = [];

  List<Procedures> get items {
    return _items;
  }

  void addProcedures(String procedure){
    final newProcedure=Procedures(id: DateTime.now().toString(), procedures:procedure);
    _items.add(newProcedure);
    notifyListeners();
    DBHelper.insertProcedure('procedures', {
      'id':newProcedure.id,
      'procedures':newProcedure.procedures
    });
  }

  Future<void> fetchAndSetProcedures() async {
    final dataList = await DBHelper.getProceduresData('procedures');
    final procedures = dataList
        .map((e) => Procedures(id: e['id'], procedures: e['procedures']))
        .toList();
    notifyListeners();
  }

  /* void addPlatient(String name, String address, String age, String phone) {
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
  }*/
}