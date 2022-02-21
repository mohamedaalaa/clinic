import 'package:clinic/model/procedures.dart';
import 'package:clinic/screens/add_procedures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrceduresScreen extends StatefulWidget {
  const PrceduresScreen({Key? key}) : super(key: key);

  @override
  _PrceduresScreenState createState() => _PrceduresScreenState();
}

class _PrceduresScreenState extends State<PrceduresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedures'),
      ),
      body: FutureBuilder(
        future: Provider.of<AddProcedure1>(context).fetchAndSetProcedures(),
        builder: (context, sh) => sh.connectionState == ConnectionState.waiting
            ? const CircularProgressIndicator()
            : Consumer<AddProcedure1>(
                builder: (context, addProcedure, ch) =>
                    addProcedure.items.isEmpty
                        ? const Center(
                            child: Text('no procedures yet'),
                          )
                        : ListView.builder(
                            itemCount: addProcedure.items.length,
                            itemBuilder: (context, i) => ListTile(
                                  title: Text(addProcedure.items[i].procedures),
                                ))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddProcedures()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
