import 'package:dog_face/main.dart';
import 'package:dog_face/models/dog.dart';
import '../../../../api/http_req_get.dart';
import 'package:flutter/material.dart';

import '../../../../appColors.dart';
import '../../../../main.dart';

class EditDog extends StatefulWidget {
  DogModel dogModel;
  EditDog({this.dogModel});

  @override
  _EditDogState createState() => _EditDogState();
}

class _EditDogState extends State<EditDog> {
  TextEditingController sexCtl = TextEditingController();
  TextEditingController firstnameCtl = TextEditingController();
  TextEditingController lastnameCtl = TextEditingController();
  TextEditingController raceCtl = TextEditingController();
  TextEditingController puceNuCtl = TextEditingController();
  TextEditingController birthDateCtl = TextEditingController();
  TextEditingController birthCertificateNuCtl = TextEditingController();
  TextEditingController passportNuCtl = TextEditingController();

  List<String> _sex = ['male', 'female'];
  String _selectedSex;

  @override
  void initState() {
    // getData();
    _selectedSex = widget.dogModel.sex;
    raceCtl.text = widget.dogModel.race;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit dog")),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              hint: Text('Selectionez une sex'),
              value: _selectedSex,
              onChanged: (newValue) {
                setState(() {
                  _selectedSex = newValue;
                });
              },
              items: _sex.map((sex) {
                return DropdownMenuItem(
                  child: new Text(sex),
                  value: sex,
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: currentDog.firstname,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              controller: firstnameCtl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: currentDog.firstname,
              onSaved: (val) {
                currentDog.firstname = val;
              },
              decoration: InputDecoration(
                  labelText: "lastname",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              //controller:,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              //  validator: requiredValidator,

              decoration: InputDecoration(
                  labelText: "Race",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              //controller:,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              //  validator: requiredValidator,

              decoration: InputDecoration(
                  labelText: currentDog.puceNu,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              //controller:,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                //     _selectDate(context);
              },
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        size: 20.0,
                        color: primaryColor,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        ("Date de naissance"),
                        style: new TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1.0, color: Colors.grey[400]),
                      ),
                      child: Text(
                        '',
                        //  convertedDate,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              //  validator: requiredValidator,
              // onSaved: (val) {
              //   dogModel.birthCertificateNu = val;
              // },
              decoration: InputDecoration(
                  labelText: "Nu acte de naissance",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              //controller:,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // validator: requiredValidator,
              // onSaved: (val) {
              //   dogModel.passportNu = val;
              // },
              decoration: InputDecoration(
                  labelText: "Numero de passport",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              //controller:,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    // Color.fromRGBO(143, 148,251,.1),
                    Color.fromRGBO(0, 191, 255, .6),
                    Color.fromRGBO(0, 191, 255, .9),
                  ])),
              child: FlatButton(
                  padding:
                      EdgeInsets.only(left: 50, top: 10, right: 50, bottom: 10),
                  onPressed: () {},
                  child: new Text(
                    "Register",
                    style: TextStyle(fontSize: 20, fontFamily: "Arial"),
                  )),
            ),
          ),
        ]),
      ),
    );
  }

  // getData() async {
  //   Map data = await RestDatasourceGet().getDogById(id: widget.dogModel.idDog);
  //   print(data);
  // }
}
