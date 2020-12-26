import 'package:dog_face/screens/dog/doc_activity/profil/documents/photoDialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../appColors.dart';

class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

ImagePicker imagePicker = ImagePicker();

// getImageFromPhone({int choice}) async {
//   PickedFile file;
//   if (choice == 1) {
//     file = await imagePicker.getImage(
//         source: ImageSource.camera, imageQuality: 60);
//   } else {
//     file = await imagePicker.getImage(
//         source: ImageSource.gallery, imageQuality: 60);
//   }
// }

// Future getImage(int index) async {
//   final pickedFile =
//       await picker.getImage(source: ImageSource.camera, imageQuality: 60);
//   setState(() {
//     imagePath[index] = pickedFile.path;
//   });
// }

// Future getImageFromGallery(int index) async {
//   final pickedFile =
//       await picker.getImage(source: ImageSource.gallery, imageQuality: 60);
//   setState(() {
//     imagePath[index] = pickedFile.path;
//   });
//   updateCompteurWithImages();
// }

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        //itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              //margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSelectionDialog(
              context: context,
              function: () {
                setState(() {});
              },
              //  index: imageIndex,
              getImage: () {
                // getImageFromPhone(choice: 1);
              },
              getImageFromGallery: () {
                //getImageFromPhone(choice: 2);
              });
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }

  void showImageDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('ffgjgvhgvhj,vbhj'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.linked_camera,
                            color: primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'fffhjhhk',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera,
                            color: primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text("gghhbhbnjbj"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
