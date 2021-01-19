import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/main.dart';
import 'package:dog_face/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../../appColors.dart';
import '../../../../main.dart';

class EditDog extends StatefulWidget {
  DogModel dogModel;
  EditDog({this.dogModel});

  @override
  _EditDogState createState() => _EditDogState();
}

class _EditDogState extends State<EditDog> {
  DateTime now = DateTime.now();
  TextEditingController sexCtl = TextEditingController();
  TextEditingController firstnameCtl = TextEditingController();
  TextEditingController lastnameCtl = TextEditingController();
  TextEditingController raceCtl = TextEditingController();
  TextEditingController puceNuCtl = TextEditingController();
  TextEditingController birthDateCtl = TextEditingController();
  TextEditingController birthCertificateNuCtl = TextEditingController();
  TextEditingController passportNuCtl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DogModel dogModel = DogModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  List<String> _sex = ['Male', 'Female'];
  String _selectedSex;
  String convertedDate = "";

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

  @override
  void initState() {
    // getData();
    _selectedSex = widget.dogModel.sex;
    raceCtl.text = widget.dogModel.race;

    firstnameCtl.text = widget.dogModel.firstname;
    lastnameCtl.text = widget.dogModel.lastname;
    firstnameCtl.text = widget.dogModel.firstname;
    puceNuCtl.text = widget.dogModel.puceNu;
    birthDateCtl.text = widget.dogModel.birthDate;
    birthCertificateNuCtl.text = widget.dogModel.birthCertificateNu;
    passportNuCtl.text = widget.dogModel.passportNu;

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
                decoration: InputDecoration(
                    labelText: "lastname",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                controller: lastnameCtl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Race",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              controller: raceCtl,
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
              controller: puceNuCtl,
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
                        border: Border.all(width: 1.0, color: Colors.grey[400]),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            // labelText: "Race",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        controller: birthDateCtl,
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
              controller: birthCertificateNuCtl,
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
              controller: passportNuCtl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(232, 120, 51, .9),
                    Color.fromRGBO(0, 77, 79, .7),
                  ])),
              child: FlatButton(
                  padding:
                      EdgeInsets.only(left: 50, top: 10, right: 50, bottom: 10),
                  onPressed: () {
                    print(dogModel.lastname);
                    widget.dogModel.firstname = firstnameCtl.text;
                    widget.dogModel.lastname = lastnameCtl.text;
                    widget.dogModel.sex = _selectedSex;
                    widget.dogModel.race = raceCtl.text;
                    widget.dogModel.birthDate = birthDateCtl.text;
                    widget.dogModel.puceNu = puceNuCtl.text;
                    widget.dogModel.birthCertificateNu =
                        birthCertificateNuCtl.text;
                    widget.dogModel.passportNu = passportNuCtl.text;
                    RestDatasourceP().dogEditApi(
                      dogModel: widget.dogModel,
                    );

                    Navigator.pop(
                      context,
                    );
                    //      }
                  },
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
