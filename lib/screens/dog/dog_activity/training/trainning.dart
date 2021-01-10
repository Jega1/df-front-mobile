import 'package:carousel_slider/carousel_slider.dart';
import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/package.dart';
import 'package:dog_face/screens/dog/dog_activity/training/step/step_screen.dart';
import 'package:dog_face/screens/dog/dog_activity/training/training_complete.dart';
import 'package:flutter/material.dart';

class TrainingStartScreen extends StatefulWidget {
  @override
  _TrainingStartScreenState createState() => _TrainingStartScreenState();
}

class _TrainingStartScreenState extends State<TrainingStartScreen> {
  bool isLoading = false;
  List allpackages = [];
  List<PackageModel> packages = [];

  @override
  void initState() {
    getData();
    print(packages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("select a category de training")),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: CarouselSlider(
                options:
                    CarouselOptions(height: 400.0, enlargeCenterPage: true),
                items: packages.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text(
                            i.description,
                            style: TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getAllPack();
    for (var item in res["message"]) {
      PackageModel model = PackageModel.fromJson(item);
      packages.add(model);
    }
    setState(() {
      isLoading = false;
    });
  }
}
