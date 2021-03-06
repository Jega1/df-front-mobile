import 'dart:io';

import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/main.dart';
import 'package:dog_face/screens/dog/dog_activity/carnet_sante/carnet_tap/tap.dart';
import 'package:dog_face/screens/dog/dog_activity/profil/documents/photoDialog.dart';
import 'package:dog_face/screens/dog/dog_activity/training/package.dart';
import 'package:dog_face/widget/photo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../appColors.dart';
import 'documents/doc.dart';
import 'documents/photo.dart';
import 'dog_edit.dart';

class DogInfoScreen extends StatefulWidget {
  @override
  _DogInfoScreenState createState() => _DogInfoScreenState();
}

class _DogInfoScreenState extends State<DogInfoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar =
      const SnackBar(content: Text("Profil de +++++++++deleted"));
  File selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Profil : " + currentDog.firstname,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'Show Snackbar',
            onPressed: () {
              //delete function
              _showDeleteDialog();
              //  _scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {},
          ),
        ],
      ),

      // leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     }),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //  margin: EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: <Widget>[
                    Hero(tag: 1, child: Image.asset('assets/logo.jpg')),
                    // GestureDetector(
                    //   onTap: () {
                    //     showSelectionDialog(
                    //         context: context,
                    //         function: () {
                    //           setState(() {});
                    //         },
                    //         //  index: imageIndex,
                    //         getImage: () async {
                    //           PickedFile file = await getImageFromCamera();
                    //           selectedImage = File(file.path);
                    //           RestDatasourceP().uplodeImage(
                    //             image: selectedImage,
                    //             id: currentDog.idDog,
                    //           );
                    //           setState(() {});
                    //         },
                    //         getImageFromGallery: () async {
                    //           PickedFile file = await imageFromGallery();
                    //           selectedImage = File(file.path);
                    //           print(selectedImage.path);
                    //           RestDatasourceP().uplodeImage(
                    //             image: selectedImage,
                    //             id: currentDog.idDog,
                    //           );
                    //           setState(() {});
                    //         });
                    //   },
                    //   child: Container(
                    //     height: 50,
                    //     width: 60,
                    //     decoration: BoxDecoration(
                    //         color: secondColor,
                    //         borderRadius: BorderRadius.circular(20)),
                    //     child: Icon(
                    //       Icons.camera_alt,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
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
                      child: Text(currentDog.birthCertificateNu),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
                      builder: (context) => PackageScreen(),
                    ),
                  );
          }
          ;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              FontAwesomeIcons.folderOpen,
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
                FontAwesomeIcons.bookMedical,
                color: secondColor,
                size: 40,
              ),
              title: Text(
                'Carnet sante',
                style: TextStyle(color: primaryColor, fontSize: 20),
              )),
          BottomNavigationBarItem(
            icon: new Icon(
              FontAwesomeIcons.dog,
              color: secondColor,
              size: 40,
            ),
            title: new Text(
              'Mes traning',
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('voulais-vous supprimer?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('vous allez perdu tous las information de votre chien'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text('OUI'),
              onPressed: () async {
                await RestDatasourceP().dogDeleteApi(id: currentDog.idDog);
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text('NON'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
