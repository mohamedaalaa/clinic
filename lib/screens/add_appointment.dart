


import 'package:clinic/model/visit.dart';
import 'package:clinic/screens/visits_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';



class AddAppointment extends StatefulWidget {
  const AddAppointment({Key? key}) : super(key: key);

  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  String _selectedDate = '';
  String _visitType='';
  final String id=DateTime.now().toString();

  void _addAppointment(){
    if(_selectedDate.isEmpty||_visitType.isEmpty){
      return;
    }
    else{
      Provider.of<BookVisit>(context,listen: false).addVisit(id,_selectedDate, _visitType);
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const VisitListScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('add appointment'),),
      body: Column(
        children: [
          Text('Selected date: $_selectedDate'),
          IconButton(onPressed: ()=>  DatePicker.showDatePicker(context,
              showTitleActions:true,
              minTime: DateTime(2019,3,5),
              maxTime: DateTime(2025,6,6),
              currentTime: DateTime.now(),
              onConfirm: (date){
                setState(() {
                  _selectedDate=DateFormat.yMd().format(date);
                });
              }
          ), icon:const Icon(Icons.timelapse)),
          ExpansionTile(title: Text('Visit Type  $_visitType'),
            children: [
              ListTile(title:const Text('Examination'),onTap: (){
                setState(() {
                  _visitType='Examination';
                });
              },),
              ListTile(title:const Text('Consultation'),onTap: (){
                setState(() {
                  _visitType='Consultation';
                });
              },),
            ],
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed:_addAppointment, child:const Text('book appointment')),
        ],
      )
    );
  }
}
