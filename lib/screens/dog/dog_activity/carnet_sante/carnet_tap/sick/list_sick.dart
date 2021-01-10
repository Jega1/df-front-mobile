import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/medical.dart';
import 'package:dog_face/screens/dog/dog_activity/carnet_sante/carnet_tap/sick/add_sick.dart';
import 'package:dog_face/screens/dog/dog_activity/carnet_sante/carnet_tap/vaccin/edit_vaccin.dart';
import 'package:flutter/material.dart';
import '../../../../../../main.dart';

class ListSick extends StatefulWidget {
  @override
  _ListSickState createState() => _ListSickState();
}

class _ListSickState extends State<ListSick> {
  bool isLoading = false;
  List<MedicalModel> sicks = [];

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
          : sicks.length == 0
              ? Center(
                  child: Text("Ajouter votre chien"),
                )
              : ListView.builder(
                  itemCount: sicks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        setState(() {});

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => EditVaccinScreen(MedicalModel)));
                      },
                      child: ListTile(
                        title: Text(sicks[index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(sicks[index].firstDate),
                            Text(sicks[index].nextDate),
                          ],
                        ),
                        leading: Icon(Icons.info_outline),
                        trailing: Text(sicks[index].firstDate),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddSick()))
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
    sicks = [];
    setState(() {
      isLoading = true;
    });
    await RestDatasourceGet()
        .getAllSicksByDog(id: currentDog.idDog)
        .then((val) {
      List temp = val["data"];
      print(temp);
      temp.forEach((sickData) {
        sicks.add(MedicalModel.fromJson(sickData));
      });
      setState(() {
        isLoading = false;
      });
    });
  }
}
