import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/appointment.dart';
import 'package:dog_face/models/dog.dart';
import 'package:dog_face/models/motif.dart';
import 'package:dog_face/models/time.dart';
import 'package:dog_face/screens/appoint/list_appoint.dart';
import 'package:dog_face/screens/user/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../appColors.dart';

class TakeAppointScreen extends StatefulWidget {
  final String name;
  final int idVet;
  final TimeModel time;

  TakeAppointScreen({this.name, this.idVet, this.time});
  @override
  _TakeAppointScreenState createState() => _TakeAppointScreenState();
}

class _TakeAppointScreenState extends State<TakeAppointScreen> {
  TextEditingController vetName = TextEditingController();
  TextEditingController userName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AppointModel appointModel = AppointModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  int _selectedDogId;
  List<MotifModel> motifs = [];
  List<String> _dog = ['Max', 'dogo'];
  String _selectedDog;

  String selectedMotif = '';
  //List<Map<String, dynamic>> dogs = [];
  TextEditingController addMotif = TextEditingController();
  bool isLoading = false;
  List<DogModel> dogs = [];
  @override
  void initState() {
    vetName.text = widget.name;
    userName.text = SharedPrefData().username;
    getDog();

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("confirmez votre rdv")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Nom de veterinaire : ",
                      style: TextStyle(fontSize: 18, color: lightBlack),
                    ),
                    SizedBox(width: 30),
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 18, color: lightBlack),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Votre nom : ",
                      style: TextStyle(fontSize: 18, color: lightBlack),
                    ),
                    SizedBox(width: 30),
                    Text(
                      SharedPrefData().username,
                      style: TextStyle(fontSize: 18, color: lightBlack),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Date : ",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(width: 30),
                    Text(
                      widget.time.time,
                      style: TextStyle(fontSize: 18, color: lightBlack),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Time : ",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(width: 30),
                    Text(
                      widget.time.time,
                      style: TextStyle(fontSize: 18, color: lightBlack),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Selectionez votre dog",
                      style: TextStyle(fontSize: 16, color: lightBlack),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 16.0, right: 26.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1.0, color: Colors.grey[400]),
                      ),
                      child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                          size: 36,
                        ),
                        isExpanded: true,
                        hint:
                            Text('Select a dog'), // Not necessary for Option 1
                        value: _selectedDog,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedDog = newValue;
                            // _selectedDogId = newValue.idDog;
                          });
                        },
                        items: dogs.map((dog) {
                          return DropdownMenuItem(
                              child: new Text(dog.firstname),
                              value: dog.firstname);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10, top: 12),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Ajouter le motif du consultation ",
                      style: TextStyle(fontSize: 16, color: lightBlack),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1.0, color: Colors.grey[400]),
                    ),
                    child: Text(
                      selectedMotif.isEmpty ? ' ' : selectedMotif,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onTap: () {
                    showSelectMotifsDialog(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        // Color.fromRGBO(143, 148,251,.1),
                        Color.fromRGBO(252, 140, 76, .9),
                        Color.fromRGBO(122, 135, 238, .9),
                      ])),
                  child: FlatButton(
                      padding: EdgeInsets.only(
                          left: 50, top: 10, right: 50, bottom: 10),
                      onPressed: () async {
                        for (var item in dogs) {
                          if (item.firstname == _selectedDog) {
                            _selectedDogId = item.idDog;
                          }
                        }
                        Map data = {
                          "available": 0,
                          "id_user": SharedPrefData().userId,
                          "id_dog": _selectedDogId,
                          "id_available": widget.time.idAvailable,
                          "id_vet": widget.idVet,
                          "motif": addMotif.text,
                        };
                        await RestDatasourceP()
                            .takeAppointApi(data: data)
                            .then((_) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => UserDashboard(),
                            ),
                            (Route<dynamic> route) => false,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointListScreen(),
                            ),
                          );
                        });

                        // }
                      },
                      child: new Text(
                        "Confirmez",
                        style: TextStyle(fontSize: 20, fontFamily: "Arial"),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //SHOW DELETE ALERT DIALOG BOX
  // _confirmAlertlDialog(BuildContext context, int index) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (param) {
  //         return AlertDialog(
  //           title: Text("vous voulez annuler le rdv?"),
  //           actions: <Widget>[
  //             FlatButton(
  //                 onPressed: () {
  //                   Map data = {
  //                     "available": 0,
  //                     "id_user": SharedPrefData().userId,
  //                     "id_dog": 25,
  //                     "id_vet_hour": widget.time.idVetHours,
  //                     "id_vet": widget.id_vet,
  //                     "motif": addMotif.text,
  //                   };
  //                   RestDatasourceP().takeAppointApi(data: data).then((val) {});

  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => AppointListScreen(),
  //                     ),
  //                   );
  //                 },
  //                 child: Text(
  //                   "confirm",
  //                   style: TextStyle(color: primaryColor, fontSize: 20),
  //                 )),
  //             FlatButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text(
  //                   "cancel",
  //                   style: TextStyle(color: primaryColor, fontSize: 20),
  //                 )),
  //           ],
  //         );
  //       });
  // }

  showSelectMotifsDialog(BuildContext context) {
    // List<Map<String, dynamic>> motifs = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: addMotif,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      selectedMotif = addMotif.text;
                    });
                    Navigator.pop(context);
                  },
                  color: primaryColor,
                  child: Text(
                    "add",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            children: motifs
                .map((e) => ListTile(
                      title: Text(e.nameMotif),
                      onTap: () {
                        setState(() {
                          addMotif.text = e.nameMotif;
                        });
                      },
                    ))
                .toList());
      },
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    motifs = [];
    Map res = await RestDatasourceGet().getAllMotif();
    List data = res["message"];
    print(data);
    for (var item in data) {
      motifs.add(
          MotifModel(idMotif: item["id_motif"], nameMotif: item["name_motif"]));
      setState(() {
        isLoading = false;
      });
    }
    // _selectedMotive = motifs[0];
  }

  void getDog() async {
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
