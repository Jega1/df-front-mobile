import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/screens/appoint/list_consult.dart';
import 'package:dog_face/screens/home/finger.dart';

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
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veterinaire dashboard'),
        actions: <Widget>[signOut()],
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AppointVetScreen()));
        },
        child: Icon(Icons.add),
        //  backgroundColor: primaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointVetScreen(),
                ));
          } else {
            index == 1
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VetListScreen(),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointListScreen(),
                    ),
                  );
          }
          ;
        },

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_alarm),
            title: new Text('Les rdv'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Historique rdv'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
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
          ];
        });
  }
}
