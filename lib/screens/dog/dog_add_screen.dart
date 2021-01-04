import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../appColors.dart';

class DogAddScreen extends StatefulWidget {
  @override
  _DogAddScreenState createState() => _DogAddScreenState();
}

class _DogAddScreenState extends State<DogAddScreen> {
  TextEditingController birthDateCtl = TextEditingController();
  DateTime now = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  DogModel dogModel = DogModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  List<String> _sex = ['Male', 'Female'];
  String _selectedSex;

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _selDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            backgroundColor: pinkDark,
            primaryColor: primaryColor,
            accentColor: primaryColor,
            colorScheme: ColorScheme.light(primary: primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    if (_selDate != null) {
      setState(() {
        now = _selDate;
        convertedDate = "${now.day.toString().padLeft(2, '0')}/"
            "${now.month.toString().padLeft(2, '0')}/"
            "${now.year.toString()}   ";

        birthDateCtl.text = convertedDate;
      });
    }
  }

  String convertedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add dog"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text(
                        'Selectionez une sex'), // Not necessary for Option 1
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
                    validator: requiredValidator,
                    onSaved: (val) {
                      dogModel.firstname = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Nom",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller:,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (val) {
                      dogModel.lastname = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Prénom",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller:,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    //  validator: requiredValidator,
                    onSaved: (val) {
                      dogModel.race = val;
                    },
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
                    validator: requiredValidator,
                    onSaved: (val) {
                      dogModel.puceNu = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Numero de puce",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller:,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
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
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[400]),
                            ),
                            child: Text(
                              convertedDate,
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
                    onSaved: (val) {
                      dogModel.birthCertificateNu = val;
                    },
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
                    onSaved: (val) {
                      dogModel.passportNu = val;
                    },
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
                          Color.fromRGBO(0, 191, 255, .6),
                          Color.fromRGBO(0, 191, 255, .9),
                        ])),
                    child: FlatButton(
                        padding: EdgeInsets.only(
                            left: 50, top: 10, right: 50, bottom: 10),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            dogModel.birthDate = birthDateCtl.text;
                            dogModel.sex = _selectedSex;
                            //      id_user= SharedPrefData().userId
                            print(dogModel.lastname);
                            RestDatasourceP().dogRegisterApi(
                              dogModel: dogModel,
                            );
                            Navigator.pop(
                              context,
                            );
                          }
                        },
                        child: new Text(
                          "Register",
                          style: TextStyle(fontSize: 20, fontFamily: "Arial"),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//1. setup shared prefernce
//2. make all the  get and set methods of sharedpreff
//3.use that id to make the user automatically log in
//4. clear the sp

// 1. adding the first dog
// 2.i have added more than two dog and then i select form one of Them
// 3. i delete my selected dog
