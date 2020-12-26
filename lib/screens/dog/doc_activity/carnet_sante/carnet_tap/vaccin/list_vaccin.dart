import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/main.dart';
import 'package:dog_face/models/vaccin.dart';
import 'package:flutter/material.dart';
import 'package:dog_face/api/http_req_get.dart';

import 'add_vaccin.dart';

class ListVaccin extends StatefulWidget {
  @override
  _ListVaccinState createState() => _ListVaccinState();
}

class _ListVaccinState extends State<ListVaccin> {
  bool isLoading = false;
  List<VaccinModel> vaccins = [];

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

                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (_) => DogInfoScreen()));
                      },
                      child: ListTile(
                        title: Text(vaccins[index].nameVaccin),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(vaccins[index].dateVaccin),
                            Text(vaccins[index].nextDate),
                          ],
                        ),
                        leading: Icon(Icons.info_outline),
                        trailing: Text(vaccins[index].dateVaccin),
                      ),
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
      temp.forEach((vaccinData) {
        vaccins.add(VaccinModel.fromJson(vaccinData));
      });
      setState(() {
        isLoading = false;
      });
    });
  }
}
