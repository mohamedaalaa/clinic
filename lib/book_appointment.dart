import 'package:clinic/model/patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPatientData extends StatefulWidget {
  const AddPatientData({Key? key}) : super(key: key);

  @override
  _AddPatientDataState createState() => _AddPatientDataState();
}

class _AddPatientDataState extends State<AddPatientData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final key = GlobalKey<FormState>();

  void _insertPatient() {
    final isValid = key.currentState!.validate();
    if (isValid) {
      Provider.of<AddPatient>(context,listen: false).addPlatient(
          nameController.text,
          addressController.text,
          ageController.text,
          phoneController.text);
    } else {
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "name can/'t be empty";
                  }
                  if (value.length < 5) {
                    return "name can/'t be less than 5 chars";
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addressController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "address can/'t be empty";
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'age',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "age can/'t be empty";
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'phone',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "phone can/'t be empty";
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: _insertPatient, child: const Text('Add Data'))
            ],
          ),
        ),
      ),
    );
  }
}
