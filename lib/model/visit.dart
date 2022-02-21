


import 'package:clinic/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class Visit {
  final String id;
  final String dateTime;
  final String visitType;

  Visit({required this.id,required this.dateTime,required this.visitType});
}

class BookVisit extends ChangeNotifier{
  List<Visit> _items = [];

  List<Visit> get items {
    return _items;
  }

  void addVisit(String time,String type,String id){
    final newVisit=Visit(dateTime: time, visitType: type, id: id);
    _items.add(newVisit);
    notifyListeners();
    DBHelper.insertVisit('visit', {
      'id': newVisit.id,
      'dateTime': newVisit.dateTime,
      'visitType' : newVisit.visitType,
    });
  }

  Future<void> fetchAndSetPatients()async{
    final dataList=await DBHelper.getVisitsData('visits');
    final visits=dataList.map((e) => Visit(id: e['id'],dateTime: e['dateTime'], visitType: 'visitType'));
    notifyListeners();
  }
  /*
  *  Future<void> fetchAndSetPatients() async {
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

 /* void addPlatient(String name, String address, String age, String phone) {
    final newPatient = Patient(
        name: name,
        age: age,
        address: address,
        phone: phone,
        id: DateTime.now().toString());
    _items.add(newPatient);
    notifyListeners();
    DBHelper.insert('patients', {
      'id': newPatient.id,
      'name': newPatient.name,
      'age': newPatient.age.toString(),
      'address': newPatient.address,
      'phone': newPatient.phone
    });
  }*/

}