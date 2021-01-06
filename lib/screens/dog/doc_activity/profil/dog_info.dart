import 'package:dog_face/main.dart';
import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/tap.dart';
import 'package:dog_face/screens/dog/doc_activity/profil/dog_edit.dart';
import 'package:dog_face/screens/dog/doc_activity/training/trainning.dart';
import 'package:dog_face/widget/menuDrawer.dart';
import 'package:flutter/material.dart';

import '../../../../appColors.dart';
import 'documents/doc.dart';
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
          "Profil : " + currentDog.firstname,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => EditDog(
                                dogModel: currentDog,
                              )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          currentDog.firstname,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Icon(
                          Icons.edit,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
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
      ),

      // body: Stack(
      //   children: <Widget>[
      //     Positioned.fill(
      //         child: Column(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             color: Colors.blueGrey[300],
      //           ),
      //         ),
      //         Expanded(
      //           child: Container(
      //             color: Colors.white,
      //           ),
      //         )
      //       ],
      //     )),
      //     Align(
      //       alignment: Alignment.topCenter,
      //       // child: Image.asset(images/,
      //       // child: Row(
      //       //   children: <Widget>[
      //       //     IconButton(
      //       //       icon: Icon(Icons.arrow_back_ios),
      //       //       onPressed: () {
      //       //         Navigator.pop(context);
      //       //       },
      //       //     )
      //       //   ],
      //       // ),
      //     )
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: lightGrey,
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocScreen(),
                ));
          } else {
            index == 1
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TapScreen(),
                    ))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrainingStartScreen(),
                    ),
                  );
          }
          ;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.folder_special,
              color: secondColor,
              size: 40,
            ),
            title: new Text(
              'Mes doc',
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sim_card_alert,
                color: secondColor,
                size: 40,
              ),
              title: Text(
                'Carnet sante',
                style: TextStyle(color: primaryColor, fontSize: 20),
              )),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.local_hospital,
              color: secondColor,
              size: 40,
            ),
            title: new Text(
              'Mes tratttti',
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
