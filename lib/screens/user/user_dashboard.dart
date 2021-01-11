import 'package:dog_face/appColors.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/screens/appoint/list_appoint.dart';
import 'package:dog_face/screens/dog/dog_activity/profil/dog_list_screen.dart';
import 'package:dog_face/screens/home/finger.dart';
import 'package:dog_face/screens/user/user_edit.dart';

import 'package:dog_face/screens/veterinary/vet_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DogListScreen(),
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // CircleAvatar(
                        //   minRadius: 30,
                        //   maxRadius: 55,
                        //   backgroundImage: NetworkImage(
                        //       'https://www.woolha.com/media/2020/03/eevee.png'),
                        // ),
                        Text(
                          "Mes dogs",
                          style: TextStyle(color: secondColor, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/dogs.jpg'),
                      fit: BoxFit.fill,
                    ),
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointListScreen(),
                        ));
                  },
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VetListScreen(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Mes veterinaires",
                            style: TextStyle(color: secondColor, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('assets/doctors.png'),
                        fit: BoxFit.fill,
                      ),
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
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointListScreen(),
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Mes RDV",
                          style: TextStyle(color: secondColor, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/app.png'),
                      fit: BoxFit.fill,
                    ),
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

      /*
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: lightGrey,
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
              FontAwesomeIcons.paw,
              color: lightBlack,
              size: 30,
            ),
            title: new Text(
              'Mes chiens',
              style: TextStyle(color: lightBlack, fontSize: 20),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              FontAwesomeIcons.hospitalUser,
              color: lightBlack,
              size: 30,
            ),
            title: new Text(
              'Mes vetos',
              style: TextStyle(color: lightBlack, fontSize: 20),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.appStoreIos,
                color: lightBlack,
                size: 30,
              ),
              title: Text(
                'Mes rdv',
                style: TextStyle(color: lightBlack, fontSize: 20),
              ))
        ],
      ),


      */
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
