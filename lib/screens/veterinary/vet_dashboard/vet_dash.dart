import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/appointment.dart';
import 'package:dog_face/screens/appoint/list_appoint.dart';
import 'package:dog_face/screens/home/finger.dart';
import 'package:dog_face/screens/veterinary/vet_dashboard/medical_info.dart';

import 'package:dog_face/screens/veterinary/vet_dashboard/vet_appointments.dart';
import 'package:dog_face/screens/veterinary/vet_dashboard/vet_edit.dart';
import 'package:dog_face/screens/veterinary/vet_list_screen.dart';
import 'package:flutter/material.dart';

class VetDashboard extends StatefulWidget {
  @override
  _VetDashboardState createState() => _VetDashboardState();
}

class _VetDashboardState extends State<VetDashboard> {
  @override
  Widget build(BuildContext context) {
    return VetDashboardScreen();
  }
}

class VetDashboardScreen extends StatefulWidget {
  @override
  _VetDashboardScreenState createState() => _VetDashboardScreenState();
}

class _VetDashboardScreenState extends State<VetDashboardScreen> {
  bool isLoading = false;
  List vets = [];
  List<AppointModel> allAppointOfVet = [];
  //List<UserModel> users = [];

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veterinaire dashboard'),
        actions: <Widget>[signOut()],
      ),
      body: ListView.builder(
        itemCount: allAppointOfVet.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MedicalInfo(appointModel: allAppointOfVet[index])));
            },
            child: ListTile(
              title: Text(allAppointOfVet[index].firstname),
              //trailing: ,
              subtitle: Column(
                children: <Widget>[
                  Text(allAppointOfVet[index].username == null
                      ? ""
                      : allAppointOfVet[index].username),
                  //  Text(allAppointOfVet[index]. == null
                  // ? ""
                  // : allAppointOfVet[index].username),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget signOut() {
    return PopupMenuButton(
        onSelected: (value) {},
        itemBuilder: (_) {
          return [
            PopupMenuItem(
              child: InkWell(
                onTap: () {
                  SharedPrefData().reset();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FingerAuthPage()),
                      (Route<dynamic> route) => false);
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings_input_svideo,
                      size: 25,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Sign out',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              // value: 'Delete',
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VetEdit(),
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      size: 25,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Profil',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              // value: 'Delete',
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VetEdit(),
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      size: 25,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        });
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    await RestDatasourceGet()
        .getAppointsByVet(id: SharedPrefData().userId)
        .then((val) {
      Map res = val;

      for (var item in res["data"]) {
        allAppointOfVet.add(AppointModel.fromJson(item));
      }
      print(allAppointOfVet.first.idDog);
      setState(() {
        isLoading = false;
      });
    });
  }
}
