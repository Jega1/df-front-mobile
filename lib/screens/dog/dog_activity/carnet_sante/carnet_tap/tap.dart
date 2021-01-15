import 'package:dog_face/screens/dog/dog_activity/carnet_sante/carnet_tap/sick/list_sick.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../appColors.dart';
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
          title: Text("voir les traitement et medical"),
          bottom: TabBar(
            indicatorColor: Colors.yellowAccent,
            indicatorWeight: 2,
            tabs: <Widget>[
              Tab(
                icon: Column(
                  children: <Widget>[
                    new Icon(
                      FontAwesomeIcons.syringe,
                      color: white,
                      size: 30,
                    ),
                    Text('Vaccin')
                  ],
                ),
              ),
              Tab(
                icon: Column(
                  children: <Widget>[
                    new Icon(
                      FontAwesomeIcons.stethoscope,
                      color: white,
                      size: 30,
                    ),
                    Text('Traitement')
                  ],
                ),
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
            ListSick(),
          ],
        ),
      ),
    );
  }
}
