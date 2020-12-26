import 'package:dog_face/main.dart';
import 'package:dog_face/screens/dog/doc_activity/profil/dog_edit.dart';
import 'package:dog_face/widget/menuDrawer.dart';
import 'package:flutter/material.dart';

import '../../../../appColors.dart';
import 'documents/doc_tap.dart';

class DogInfoScreen extends StatefulWidget {
  @override
  _DogInfoScreenState createState() => _DogInfoScreenState();
}

class _DogInfoScreenState extends State<DogInfoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "information : " + currentDog.firstname,
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                if (_scaffoldKey.currentState.isDrawerOpen) {
                  _scaffoldKey.currentState.openEndDrawer();
                } else {
                  _scaffoldKey.currentState.openEndDrawer();
                }
              },
            ),
          ],
        ),
        endDrawer: MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 70.0, left: 40.0),
                width: double.infinity,
                height: 250.0,
                color: primaryColor,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.image,
                      size: 80.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      currentDog.firstname,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => EditDog()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    color: Colors.grey,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Profil",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 50.0),
                          Icon(
                            Icons.edit,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => DogTapScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    color: Colors.grey,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Ajouter les documents et les photos",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 50.0),
                          Icon(
                            Icons.camera_alt,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(currentDog.firstname),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(currentDog.sex),
              )
            ],
          ),
        ));
  }
}
