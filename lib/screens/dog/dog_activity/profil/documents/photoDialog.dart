import 'package:flutter/material.dart';

Future<void> showSelectionDialog(
    {BuildContext context,
    Function function,
    int index,
    Function getImage,
    Function getImageFromGallery}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Ajouter un photo"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.linked_camera,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Camera')
                      ],
                    ),
                    onTap: () async {
                      await getImage();

                      Navigator.pop(context);
                      function();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Gallery')
                      ],
                    ),
                    onTap: () {
                      getImageFromGallery();
                      Navigator.pop(context);
                      function();
                    },
                  )
                ],
              ),
            ));
      });
}
