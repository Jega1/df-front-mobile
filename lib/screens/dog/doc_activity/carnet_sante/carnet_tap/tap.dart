import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/maladie/maladie.dart';
import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/vaccin/add_vaccin.dart';
import 'package:flutter/material.dart';

import 'vaccin/list_vaccin.dart';

class TapScreen extends StatefulWidget {
  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("gtt"),
          bottom: TabBar(
            indicatorColor: Colors.yellowAccent,
            indicatorWeight: 2,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.details),
                text: ("Vaccin"),
              ),
              Tab(
                icon: Icon(Icons.category),
                text: ("Traitement"),
              ),
              // Tab(
              //   icon: Icon(Icons.stars),
              //   text: ("meulbles"),
              // ),
              // Tab(icon: Icon(Icons.camera_alt), text: ("photos")),
            ],
          ),
        ),
        //    drawer: MenuDrawer(),
        body: TabBarView(
          children: <Widget>[
            ListVaccin(),
            AddMaladie(),
          ],
        ),
      ),
    );
  }
}
