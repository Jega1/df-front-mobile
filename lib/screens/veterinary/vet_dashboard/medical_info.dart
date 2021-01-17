import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/models/appointment.dart';
import 'package:flutter/material.dart';

class MedicalInfo extends StatefulWidget {
  AppointModel appointModel;
  MedicalInfo({@required this.appointModel});

  @override
  _MedicalInfoState createState() => _MedicalInfoState();
}

class _MedicalInfoState extends State<MedicalInfo> {
  List allVaccine = [];
  List allSick = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            height: 60 * allVaccine.length.toDouble(),
            child: ListView.builder(
              itemCount: allVaccine.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(allVaccine[index]["name"]),
                );
              },
            ),
          ),
          Text("All sick"),
          Container(
            height: 60 * allSick.length.toDouble(),
            child: ListView.builder(
              itemCount: allSick.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(allSick[index]["name"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void getData() async {
    Map res = await RestDatasourceGet()
        .getAllVaccinsByDog(id: widget.appointModel.idDog);
    allVaccine = res["data"];
    res = await RestDatasourceGet()
        .getAllSicksByDog(id: widget.appointModel.idDog);
    allSick = res["data"];
    print(allVaccine);
    setState(() {});
  }
}
