import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/package.dart';
import 'package:dog_face/screens/dog/doc_activity/training/step/step_screen.dart';
import 'package:dog_face/screens/dog/doc_activity/training/training_complete.dart';
import 'package:flutter/material.dart';

class TrainingStartScreen extends StatefulWidget {
  @override
  _TrainingStartScreenState createState() => _TrainingStartScreenState();
}

class _TrainingStartScreenState extends State<TrainingStartScreen> {
  bool isLoading = false;
  List allpackages = [];
  List<PackageModel> packages = [];

  @override
  void initState() {
    getData();
    print(packages);
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("select a category de training")),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => TrainingComplete()));
              },
              child: Container(
                width: double.infinity,
                height: 80.0,
                color: Colors.grey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Voir tous les competence de Max",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 50.0),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => StepScreen()));
              },
              child: Container(
                width: double.infinity,
                height: 80.0,
                color: Colors.grey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Categorie 1",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 50.0),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getAllPack();
    allpackages = res["data"];
    setState(() {
      isLoading = false;
    });
  }
}
