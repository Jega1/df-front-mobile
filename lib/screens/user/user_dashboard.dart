import 'package:dog_face/appColors.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/screens/appoint/list_consult.dart';
import 'package:dog_face/screens/dog/dog_list_screen.dart';
import 'package:dog_face/screens/home/finger.dart';
import 'package:dog_face/screens/user/user_edit.dart';
import 'package:dog_face/screens/veterinary/vet_list_screen.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'user dashboard',
        ),
        actions: <Widget>[signOut()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Vous avez 1 chien",
                        style: TextStyle(color: secondColor, fontSize: 20),
                      )
                    ],
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: lightBlack,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Appointments",
                        style: TextStyle(color: secondColor, fontSize: 20),
                      )
                    ],
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: lightBlack,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Memo",
                        style: TextStyle(color: secondColor, fontSize: 20),
                      )
                    ],
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: lightBlack,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Vetos",
                        style: TextStyle(color: secondColor, fontSize: 20),
                      )
                    ],
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: lightBlack,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondColor,
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DogListScreen(),
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
                    ));
          }
          ;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.cloud_queue,
              color: primaryColor,
              size: 40,
            ),
            title: new Text(
              'Mes chiens',
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.local_hospital,
              color: primaryColor,
              size: 40,
            ),
            title: new Text(
              'Mes vetos',
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: primaryColor,
                size: 40,
              ),
              title: Text(
                'Mes rdv',
                style: TextStyle(color: primaryColor, fontSize: 20),
              ))
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
                      builder: (context) => UserEdit(),
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
