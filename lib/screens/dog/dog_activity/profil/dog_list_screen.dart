import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/main.dart';
import 'package:dog_face/models/dog.dart';
import 'package:flutter/material.dart';
import '../../../../appColors.dart';

import 'dog_info.dart';
import 'dog_add_screen.dart';

class DogListScreen extends StatefulWidget {
  final int id;
  DogListScreen({this.id});

  @override
  _DogListScreenState createState() => _DogListScreenState();
}

class _DogListScreenState extends State<DogListScreen> {
  bool isLoading = false;
  List<DogModel> dogs = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listes des chiens'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dogs.length == 0
              ? Center(
                  child: Text("Ajouter votre chien"),
                )
              : ListView.builder(
                  itemCount: dogs == null ? 0 : dogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          currentDog = dogs[index];
                        });

                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DogInfoScreen()));
                      },
                      child: ListTile(
                        title: Text(dogs[index].firstname),
                        leading: Icon(Icons.donut_large),
                        trailing: Text(dogs[index].race),
                      ),
                    );
                  },
                ),

      //         isLoading
      //             ? Center(
      //                 child: CircularProgressIndicator(),
      //               )
      //             : ListView.builder(
      //                 itemCount: dogs.length,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   return dogListCont(dogs[index]);
      //                 },
      //               ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => DogAddScreen()))
              .whenComplete(() {
            getData();
          });
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
    // }

    // Container dogListCont(
    //   DogModel item,
    // ) {
    //   return Container(
    //     height: 240,
    //     margin: EdgeInsets.symmetric(horizontal: 20),
    //     child: GestureDetector(
    //       onTap: () {
    //         setState(() {
    //           currentDog = item;
    //         });

    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (_) => DogInfoScreen()))
    //             .then((val) {
    //           getData();
    //         });
    //       },
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     // color: secondColor,
    //                     borderRadius: BorderRadius.circular(20),
    //                     boxShadow: shadowList,
    //                     image: DecorationImage(
    //                       fit: BoxFit.cover,
    //                       image: item.img.length != 0
    //                           ? NetworkImage(
    //                               item.img[0]["dog_image"],
    //                             )
    //                           : AssetImage('assets/sh.png'),
    //                     ),
    //                   ),
    //                   margin: EdgeInsets.only(top: 50),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //               child: Container(
    //             margin: EdgeInsets.only(top: 60, bottom: 20),
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 boxShadow: shadowList,
    //                 borderRadius: BorderRadius.only(
    //                     topRight: Radius.circular(20),
    //                     bottomRight: Radius.circular(20))),
    //             child: Column(
    //               children: <Widget>[
    //                 Text(item.firstname),
    //                 Text(item.lastname),
    //                 Text(item.race),
    //               ],
    //             ),
    //           ))
    //         ],
    //       ),
    //     ),
  }

  void getData() async {
    dogs = [];
    setState(() {
      isLoading = true;
    });
    await RestDatasourceGet()
        .getDogsByUser(id: SharedPrefData().userId)
        .then((val) {
      List temp = val["data"];
      if (temp != null) {
        temp.forEach((dogData) {
          dogs.add(DogModel.fromJson(dogData));
        });
      }

      setState(() {
        isLoading = false;
      });
    });
  }
}
