import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/appColors.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/main.dart';
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
                          "",
                          style: TextStyle(color: secondColor, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/dog-face-10.png'),
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
                            "",
                            style: TextStyle(color: secondColor, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('assets/dog-face-11.png'),
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
                          "",
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
            PopupMenuItem(
              // value: 'Delete',
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => UserEdit(),
                  //   ),
                  // );
                  RestDatasourceP().userDeleteApi(id: SharedPrefData().userId);
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete_sweep,
                      size: 25,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Delete my profil',
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
