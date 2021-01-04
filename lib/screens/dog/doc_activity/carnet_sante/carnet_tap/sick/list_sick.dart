import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/sick/add_sick.dart';
import 'package:flutter/material.dart';

class ListSick extends StatefulWidget {
  @override
  _ListSickState createState() => _ListSickState();
}

class _ListSickState extends State<ListSick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddSick()));
          //     .whenComplete(() {
          //   getData();
          // });
        },
        child: Icon(Icons.add),
        //  backgroundColor: primaryColor,
      ),
    );
  }
}
