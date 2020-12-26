import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/time.dart';
import 'package:dog_face/screens/user/user_dashboard.dart';
import 'package:flutter/material.dart';

import '../../appColors.dart';

class AppointListScreen extends StatefulWidget {
  final TimeModel time;
  AppointListScreen({this.time});

  @override
  _AppointListScreenState createState() => _AppointListScreenState();
}

class _AppointListScreenState extends State<AppointListScreen> {
  bool isLoading = false;
  List allConsult = [];

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
          : allConsult.length == 0
              ? Center(
                  child: Text("No rdv here"),
                )
              : ListView.builder(
                  itemCount: allConsult.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // allConsult[index]["id_vet_hour"];
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            allConsult[index]["username"].toString(),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: primaryColor),
                          ),
                          leading:
                              Icon(Icons.broken_image, color: primaryColor),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                allConsult[index]["code_postal"].toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                allConsult[index]["address_cabinet"].toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                allConsult[index]["firstname"].toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                allConsult[index]["id_vet_hour"].toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          trailing: new Column(
                            children: <Widget>[
                              new Container(
                                child: new IconButton(
                                  icon: new Icon(Icons.cancel),
                                  color: red,
                                  onPressed: () {
                                    _confirmAlertlDialog(context, index);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
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
        .getAppointsByUser(id: SharedPrefData().userId)
        .then((val) {
      Map res = val;
      allConsult = res["data"];
      setState(() {
        isLoading = false;
      });
    });
  }

  //SHOW DELETE ALERT DIALOG BOX
  _confirmAlertlDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            title: Text("vous voulez annuler le rdv?"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () async {
                    Map data = {
                      "available": 1,
                      "id_vet_hour": allConsult[index]["id_vet_hour"],
                    };
                    print("data");
                    await RestDatasourceP()
                        .cancelAppointApi(data: data)
                        .whenComplete(() {
                      setState(() async {
                        await getData();
                        //Show allert dialog delete succes
                        //    Get.snakebar();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => UserDashboard(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      });
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointListScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "confirm",
                    style: TextStyle(color: primaryColor, fontSize: 20),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "cancel",
                    style: TextStyle(color: primaryColor, fontSize: 20),
                  )),
            ],
          );
        });
  }
}
