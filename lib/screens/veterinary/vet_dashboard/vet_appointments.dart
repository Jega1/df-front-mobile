import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/datas/sharedPref.dart';

import 'package:flutter/material.dart';

class AppointVetScreen extends StatefulWidget {
  @override
  _AppointVetScreenState createState() => _AppointVetScreenState();
}

class _AppointVetScreenState extends State<AppointVetScreen> {
  bool isLoading = false;
  List allVetConsult = [];

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
          : allVetConsult.length == 0
              ? Center(
                  child: Text("No rdv here"),
                )
              : ListView.builder(
                  itemCount: allVetConsult.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Text(allVetConsult[index]["id_user"].toString()),
                        leading: Icon(Icons.local_hospital),
                        trailing:
                            Text(allVetConsult[index]["motif"].toString()),
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
        .getAppointsByVet(id: SharedPrefData().userId)
        .then((val) {
      Map res = val;
      allVetConsult = res["data"];
    });
    setState(() {
      isLoading = false;
    });
  }
}
