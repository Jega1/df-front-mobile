import 'package:dog_face/main.dart';

import 'package:dog_face/screens/dog/doc_activity/profil/documents/doc.dart';
import 'package:dog_face/screens/dog/doc_activity/profil/documents/photo.dart';
import 'package:flutter/material.dart';

class DogTapScreen extends StatefulWidget {
  @override
  _DogTapScreenState createState() => _DogTapScreenState();
}

class _DogTapScreenState extends State<DogTapScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentDog.firstname),
          bottom: TabBar(
            indicatorColor: Colors.yellowAccent,
            indicatorWeight: 2,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: ("Documents"),
              ),
              Tab(
                icon: Icon(Icons.details),
                text: ("Photos"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DocScreen(),
            PhotoScreen(),
          ],
        ),
      ),
    );
  }
}
