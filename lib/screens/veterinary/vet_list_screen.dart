import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/veterinary/vet_available.dart';
import 'package:dog_face/widget/searchBar.dart';

import 'package:flutter/material.dart';

import '../../appColors.dart';

class VetListScreen extends StatefulWidget {
  @override
  _VetListScreenState createState() => _VetListScreenState();
}

class _VetListScreenState extends State<VetListScreen> {
  bool isLoading = false;
  List allvet = [];
  List<UserModel> users = [];
  TextEditingController searchCtl = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list of all vetos"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : allvet.length == 0
              ? Center(
                  child: Text("No veterinary in this area"),
                )
              : Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10), child: SearchBar()),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemCount: allvet.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => VetAvailable(
                                                  idVet: allvet[index]
                                                      ["id_user"],
                                                  name: allvet[index]
                                                      ["username"])));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10),
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                primaryColor.withOpacity(0.1)),
                                        child: ListTile(
                                          leading: Image.asset(
                                              'assets/images/logo.jpg'),
                                          title: Text(
                                            'Dr. ' + allvet[index]["username"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: titleTextColor),
                                          ),
                                          //   leading: Icon(Icons.local_hospital),
                                          subtitle: Text(
                                            allvet[index]["address"],
                                            style: TextStyle(
                                                color: titleTextColor
                                                    .withOpacity(0.7)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getAllVetApi();
    allvet = res["data"];
    setState(() {
      isLoading = false;
    });
  }
}
