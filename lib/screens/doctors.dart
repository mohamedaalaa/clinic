import 'package:clinic/model/assessment.dart';
import 'package:clinic/screens/add_assessment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessments'),
      ),
      body: FutureBuilder(
        future: Provider.of<AddAssessment1>(context).fetchAndSetAssessment(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const CircularProgressIndicator()
            : Consumer<AddAssessment1>(
                builder: (context, addAssessment, ch) =>
                    addAssessment.items.isEmpty
                        ? Center(child: const Text('No assessments yet'))
                        : ListView.builder(
                            itemCount: addAssessment.items.length,
                            itemBuilder: (context, i) => ListTile(
                                  title: Text(addAssessment.items[i].diagonis),
                                  subtitle:
                                      Text(addAssessment.items[i].prescription),
                                ))),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddAssessment()));
        },
      ),
    );
  }
}
