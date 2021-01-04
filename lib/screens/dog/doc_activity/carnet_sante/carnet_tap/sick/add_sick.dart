import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/models/medical.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../../appColors.dart';
import '../../../../../../main.dart';

class AddSick extends StatefulWidget {
  @override
  _AddSickState createState() => _AddSickState();
}

class _AddSickState extends State<AddSick> {
  final _formKey = GlobalKey<FormState>();

  MedicalModel medicalModel = MedicalModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  TextEditingController nameCtl = TextEditingController();
  TextEditingController treatmentCtl = TextEditingController();
  TextEditingController firstDateCtl = TextEditingController();
  TextEditingController nextDateCtl = TextEditingController();
  TextEditingController observationCtl = TextEditingController();

  DateTime now = DateTime.now();

  List<MedicalModel> medicals = [];
  bool isLoading = false;

  String selectedVaccin = '';
  String convertedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajouter les traitement"),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: requiredValidator,
                    onSaved: (val) {
                      medicalModel.name = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Maladie",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //   controller: nameCtl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Traitement",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    controller: treatmentCtl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
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
                              ("Date de traiement "),
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
                              firstDateCtl.text,
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
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      _selectNextDate(context);
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
                              ("Date de rappelle"),
                              style: new TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
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
                              nextDateCtl.text,
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
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Observation",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    controller: observationCtl,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        padding: EdgeInsets.only(
                            left: 50, top: 10, right: 50, bottom: 10),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            medicalModel.idDog = currentDog.idDog;
                            medicalModel.treatment = treatmentCtl.text;
                            medicalModel.firstDate = firstDateCtl.text;
                            medicalModel.nextDate = nextDateCtl.text;
                            medicalModel.observation = observationCtl.text;
                            medicalModel.typeMedical = 0;
                            await RestDatasourceP()
                                .medicalRegisterApi(
                              medicalModel: medicalModel,
                            )
                                .then((onValue) {
                              Navigator.pop(
                                context,
                              );
                            });
                          }
                          ;
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
        ));
  }

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

        firstDateCtl.text = convertedDate;
      });
    }
  }

  Future<Null> _selectNextDate(BuildContext context) async {
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

        nextDateCtl.text = convertedDate;
      });
    }
  }
}
