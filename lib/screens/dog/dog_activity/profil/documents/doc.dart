import 'package:dog_face/screens/dog/dog_activity/profil/documents/photo.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/main.dart';

class DocScreen extends StatefulWidget {
  @override
  _DocScreenState createState() => _DocScreenState();
}

class _DocScreenState extends State<DocScreen> {
  List allImages = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add a document'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => PhotoScreen()))
            .then((val) {
          getData();
        });
      }),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : allImages.length == 0
              ? Center(
                  child: Text('Error:'),
                )
              : Container(
                  child: buildGridView(),
                ),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        allImages.length,
        (index) {
          return InkWell(
            onTap: () {},
            child: Container(
              child: Image.network(allImages[index]["dog_image"]),
            ),
          );
        },
      ),
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getImagesByDogId(id: currentDog.idDog);
    allImages = res["data"] == "The dog has no images" ? [] : res["data"];

    setState(() {
      isLoading = false;
    });
  }
}
