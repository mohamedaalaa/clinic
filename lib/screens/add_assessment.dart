


import 'package:clinic/model/assessment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAssessment extends StatefulWidget {
  const AddAssessment({Key? key}) : super(key: key);

  @override
  _AddAssessmentState createState() => _AddAssessmentState();
}

class _AddAssessmentState extends State<AddAssessment> {
  TextEditingController diagnosisController= TextEditingController();
  TextEditingController prescriptionController= TextEditingController();
  TextEditingController labController= TextEditingController();
  TextEditingController priceController= TextEditingController();

  final key=GlobalKey<FormState>();

  void _addAssessment(){
    var isValid=key.currentState!.validate();
    if(isValid){
      Provider.of<AddAssessment1>(context,listen: false).addAssessment(diagnosisController.text, prescriptionController.text, labController.text,priceController.text);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              controller: diagnosisController,
              decoration: InputDecoration(
                hintText:'diagonis',
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "diagonis can't be empty";
                }else if(value.length<5){
                  return "diagonis can't be less than 5 chars";
                }
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: prescriptionController,
              decoration:const InputDecoration(
                hintText:'prescription',
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "prescription can't be empty";
                }else if(value.length<5){
                  return "prescription can't be less than 5 chars";
                }
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: labController,
              decoration:const InputDecoration(
                hintText:'lab',
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "lab can't be empty";
                }else if(value.length<5){
                  return "lab can't be less than 5 chars";
                }
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: priceController,
              decoration:const InputDecoration(
                hintText:'price',
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "price can't be empty";
                }
              },
            ),
            const SizedBox(height:20,),
            ElevatedButton(onPressed: _addAssessment, child: const Text('add prescription'))
          ],
        ),
      ),
    );
  }
}
