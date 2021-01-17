import 'dart:io';

import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/main.dart';
import 'package:dog_face/screens/dog/dog_activity/profil/documents/photoDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../../../../appColors.dart';

class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  List<Asset> resultList = List<Asset>();
  List<Asset> images = List<Asset>();
  String error = "No error detected";
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState

    loadAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un document'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : images.length == 0
              ? Center(
                  child: Text('Error: $error'),
                )
              : Container(
                  child: buildGridView(),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          for (var item in images) {
            var path =
                await FlutterAbsolutePath.getAbsolutePath(item.identifier);
            var file = await getImageFileFromAsset(path);
            await RestDatasourceP()
                .uplodeImage(image: file, id: currentDog.idDog);
          }
          Navigator.pop(context);
          setState(() {
            isLoading = false;
          });
        },
        child: Icon(Icons.cloud_upload),
        backgroundColor: primaryColor,
      ),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<File> getImageFileFromAsset(String path) async {
    final file = File(path);
    return file;
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#F58524",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      // _error = error;
    });
  }
}
