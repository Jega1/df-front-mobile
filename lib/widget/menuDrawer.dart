import 'package:dog_face/main.dart';

import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/tap.dart';
import 'package:dog_face/screens/dog/doc_activity/profil/dog_edit.dart';
import 'package:dog_face/screens/dog/doc_activity/training/trainning.dart';
import 'package:flutter/material.dart';
import '../appColors.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 70.0, left: 40.0),
          width: double.infinity,
          height: 250.0,
          color: primaryColor,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        CustomListTile(
            Icons.info,
            "Carnet santé",
            () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TapScreen()))
                }),
        CustomListTile(
            Icons.info,
            "Memo",
            () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TapScreen()))
                }),
        CustomListTile(
            Icons.info,
            "Trainning",
            () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => TrainingStartScreen()))
                }),

        /*     CustomListTile(Icons.exit_to_app,  AppLocalizations.of(context).translate("signout"), () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      AppLocalizations.of(context)
                          .translate("pointDeDeconnexion"),
                    ),
                    actions: <Widget>[
                      RaisedButton(
                          onPressed: () {
                            saveData();

                            SharedData().reset();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text("yes")),
                      RaisedButton(onPressed: () {}, child: Text("non"))
                    ],
                  ));
        }),*/
      ],
    ));
  }

  void saveData() {}
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;

  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: primaryColor)),
        ),
        child: InkWell(
            splashColor: Colors.pinkAccent,
            onTap: onTap,
            child: Container(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(icon, color: pinkDark),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_right, color: pinkDark)
                ],
              ),
            )),
      ),
    );
  }
}
