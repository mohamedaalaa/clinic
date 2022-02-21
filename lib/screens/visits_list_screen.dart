import 'package:clinic/model/visit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisitListScreen extends StatefulWidget {
  const VisitListScreen({Key? key}) : super(key: key);

  @override
  _VisitListScreenState createState() => _VisitListScreenState();
}

class _VisitListScreenState extends State<VisitListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<BookVisit>(context).fetchAndSetPatients(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : Consumer<BookVisit>(
                    builder: (context, addVisit, ch) => addVisit.items.isEmpty
                        ? const Text('no visits yet')
                        : ListView.builder(
                            itemCount: addVisit.items.length,
                            itemBuilder: (_, i) => ListTile(
                              title: Text(addVisit.items[i].visitType),
                              subtitle: Text(addVisit.items[i].dateTime),
                            ),
                          ),
                  ),
      ),
    );
  }
}
