

import 'package:clinic/model/procedures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProcedures extends StatefulWidget {
  const AddProcedures({Key? key}) : super(key: key);

  @override
  _AddProceduresState createState() => _AddProceduresState();
}

class _AddProceduresState extends State<AddProcedures> {
  TextEditingController procedureController=TextEditingController();
  final key=GlobalKey<FormState>();

  void _addProcedure(){
    bool isValid=key.currentState!.validate();
    if(isValid){
      Provider.of<AddProcedure1>(context,listen: false).addProcedures(procedureController.text);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('add procedures'),),
      body: Form(
        key:key,
        child: Column(
          children: [
            TextFormField(
              controller: procedureController,
              decoration:const InputDecoration(
                hintText: 'procedure'
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "value can't be empty";
                }else if(value.length<5){
                  return "procedure can't be less than 5 chars";
                }
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed:_addProcedure, child: const Text('Add Procedure'))
          ],
        ),
      ),
    );
  }
}
