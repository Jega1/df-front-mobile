import 'package:dog_face/main.dart';
import 'package:dog_face/models/medical.dart';

import 'package:dog_face/screens/dog/dog_activity/carnet_sante/carnet_tap/vaccin/edit_vaccin.dart';
import 'package:flutter/material.dart';
import 'package:dog_face/api/http_req_get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../appColors.dart';
import 'add_vaccin.dart';

class ListVaccin extends StatefulWidget {
  @override
  _ListVaccinState createState() => _ListVaccinState();
}

class _ListVaccinState extends State<ListVaccin> {
  bool isLoading = false;
  List<MedicalModel> vaccins = [];

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : vaccins.length == 0
              ? Center(
                  child: Text("Ajouter votre chien"),
                )
              : ListView.builder(
                  itemCount: vaccins.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        setState(() {});

                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 400,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => EditVaccinScreen(
                                                vaccins[index])))
                                        .then((cal) {
                                      getData();
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[Text("edit")],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: <Widget>[Text("delete")],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                          title: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 10),
                            child: Text(vaccins[index].name),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(vaccins[index].firstDate),
                              SizedBox(
                                height: 5,
                              ),
                              Text(vaccins[index].nextDate),
                            ],
                          ),
                          trailing: Icon(
                            Icons.delete_sweep,
                            color: red,
                            size: 20,
                          ),
                          leading: Icon(
                            FontAwesomeIcons.closedCaptioning,
                            color: darkBrown,
                            size: 30,
                          )),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddVaccin()))
              .whenComplete(() {
            getData();
          });
          // Get.to(AddVaccin());
        },
        child: Icon(Icons.add),
        //  backgroundColor: primaryColor,
      ),
    );
  }

  void getData() async {
    vaccins = [];
    setState(() {
      isLoading = true;
    });
    await RestDatasourceGet()
        .getAllVaccinsByDog(id: currentDog.idDog)
        .then((val) {
      List temp = val["data"];
      print(temp);
      temp.forEach((vaccinData) {
        vaccins.add(MedicalModel.fromJson(vaccinData));
      });
      setState(() {
        isLoading = false;
      });
    });
  }
}
