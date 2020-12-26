import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/time.dart';
import 'package:dog_face/screens/appoint/take_appoint.dart';
import 'package:flutter/material.dart';

class VetAvailable extends StatefulWidget {
  final int id_vet;
  final String name;
  final String time;
  final dogModel;
  VetAvailable({this.id_vet, this.name, this.time, this.dogModel});

  @override
  _VetAvailableState createState() => _VetAvailableState();
}

class _VetAvailableState extends State<VetAvailable> {
  bool isLoading = false;
  List allAvailable = [];
  List<TimeModel> times = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : times.length == 0
              ? Center(
                  child: Text("Le docteur n'est pas disponible"),
                )
              : GridView.count(
                  primary: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.99,
                  children: List.generate(times.length, (index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TakeAppointScreen(
                                name: widget.name,
                                id_vet: widget.id_vet,
                                time: times[index],
                              ),
                            ),
                          ).whenComplete(() {
                            getData();
                          });
                        },
                        child: getStructuredGridCell(times[index]));
                  }),
                ),
    );
  }

  void getData() async {
    times = [];
    setState(() {
      isLoading = true;
    });
    await RestDatasourceGet().getHoursByVet(id: widget.id_vet).then((val) {
      List temp = val["data"];
      temp.forEach((timeData) {
        times.add(TimeModel.fromJson(timeData));
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  Card getStructuredGridCell(TimeModel data) {
    return new Card(
        elevation: 5.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(data.time),
                ],
              ),
            ),
          ],
        ));
  }
}
