import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:flutter/material.dart';

class AppointVetScreen extends StatefulWidget {
  @override
  _AppointVetScreenState createState() => _AppointVetScreenState();
}

class _AppointVetScreenState extends State<AppointVetScreen> {
  bool isLoading = false;
  List allAppointOfVet = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("votre consultations"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : allAppointOfVet.length == 0
              ? Center(
                  child: Text("No rdvdddd here"),
                )
              : ListView.builder(
                  itemCount: allAppointOfVet.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title:
                            Text(allAppointOfVet[index]["id_user"].toString()),
                        leading: Icon(Icons.local_hospital),
                        trailing:
                            Text(allAppointOfVet[index]["motif"].toString()),
                      ),
                    );
                  }),
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    await RestDatasourceGet()
        .getAppointsByVet(id: SharedPrefData().vetId)
        .then((val) {
      Map res = val;
      allAppointOfVet = res["data"];
      print(res);
      setState(() {
        isLoading = false;
      });
    });
  }
}
