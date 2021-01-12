import 'package:carousel_slider/carousel_slider.dart';
import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/package.dart';
import 'package:dog_face/screens/dog/dog_activity/training/lesson.dart';

import 'package:flutter/material.dart';

import '../../../../appColors.dart';

class PackageScreen extends StatefulWidget {
  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
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
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => LessonScreen()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: secondColor),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    i.namePackage,
                                    style:
                                        TextStyle(fontSize: 25.0, color: white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    i.description,
                                    style:
                                        TextStyle(fontSize: 18.0, color: white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    i.description,
                                    style:
                                        TextStyle(fontSize: 18.0, color: white),
                                  ),
                                ),
                              ],
                            )),
                      );
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
