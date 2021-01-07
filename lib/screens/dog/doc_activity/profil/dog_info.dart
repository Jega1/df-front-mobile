import 'package:dog_face/main.dart';
import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/tap.dart';
import 'package:dog_face/screens/dog/doc_activity/training/trainning.dart';
import 'package:flutter/material.dart';
import '../../../../appColors.dart';

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'documents/doc.dart';
import 'dog_edit.dart';

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
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: lightGrey,
                ),
              ),
              Expanded(
                child: Container(
                  color: primaryColor,
                ),
              )
            ],
          )),
          Container(
            //  margin: EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                children: <Widget>[
                  Hero(tag: 1, child: Image.asset('logo.png')),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditDog(
                          dogModel: currentDog,
                        )));
              },
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadowList,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      currentDog.firstname,
                      style: TextStyle(
                        color: secondColor,
                        fontSize: 30.0,
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      size: 30.0,
                      color: secondColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      currentDog.firstname,
                      style: TextStyle(color: secondColor, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(currentDog.sex),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: lightGrey,
        currentIndex: 0,
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

// class DogInfoScreenState extends State<DogInfoScreen> {

// File file;
//  void _choose() async {
//    file = await ImagePicker.pickImage(source: ImageSource.camera);
// // file = await ImagePicker.pickImage(source: ImageSource.gallery);
//  }

//  void _upload() {
//    if (file == null) return;
//    String base64Image = base64Encode(file.readAsBytesSync());
//    String fileName = file.path.split("/").last;

// //    http.post(phpEndPoint, body: {
// //      "image": base64Image,
// //      "name": fileName,
// //    }).then((res) {
// //      print(res.statusCode);
// //    }).catchError((err) {
// //      print(err);
// //    });
// //  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: _choose,
//                 child: Text('Choose Image'),
//               ),
//               SizedBox(width: 10.0),
//               RaisedButton(
//                 onPressed: _upload,
//                 child: Text('Upload Image'),
//               )
//             ],
//           ),
//           file == null ? Text('No Image Selected') : Image.file(file)
//         ],
//       ),
//     );
//   }
// }
