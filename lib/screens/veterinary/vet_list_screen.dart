import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/veterinary/vet_available.dart';

import 'package:flutter/material.dart';

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
              : ListView.builder(
                  itemCount: allvet.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => VetAvailable(
                                id_vet: allvet[index]["id_vet"],
                                name: allvet[index]["username"])));
                      },
                      child: ListTile(
                        title: Text(allvet[index]["username"]),
                        leading: Icon(Icons.local_hospital),
                        trailing: Text(allvet[index]["address_cabinet"]),
                      ),
                    );
                  }),
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
