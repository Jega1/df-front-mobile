import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/models/medical.dart';
import 'package:dog_face/models/vaccin.dart';
import 'package:flutter/material.dart';

import '../../../../../../appColors.dart';
import '../../../../../../main.dart';
import '../tap.dart';

class EditVaccinScreen extends StatefulWidget {
  MedicalModel medicalModel;
  EditVaccinScreen(this.medicalModel);

  @override
  _EditVaccinScreenState createState() => _EditVaccinScreenState();
}

class _EditVaccinScreenState extends State<EditVaccinScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCtl = TextEditingController();
  TextEditingController firstDateCtl = TextEditingController();
  TextEditingController nextDateCtl = TextEditingController();
  TextEditingController observationCtl = TextEditingController();

  DateTime now = DateTime.now();
  List<MedicalModel> vaccins = [];
  List<MedicalModel> medicals = [];
  bool isLoading = false;
  String selectedVaccin = '';
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

  void initState() {
    super.initState();

    nameCtl.text = widget.medicalModel.name;
    nameCtl.text = widget.medicalModel.name;
    firstDateCtl.text = widget.medicalModel.firstDate;
    nextDateCtl.text = widget.medicalModel.nextDate;
    observationCtl.text = widget.medicalModel.observation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('edit vaccin')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    // Icon(
                    //   Icons.plus_one,
                    //   size: 20.0,
                    //   color: primaryColor,
                    // ),
                    // SizedBox(width: 10.0),
                    // Text(
                    //   "selectioner un vaccin ",
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w500,
                    //       color: Colors.black54),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "name vaccin",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: nameCtl,
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
                            ("Date de vaccin"),
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
                            border:
                                Border.all(width: 1.0, color: Colors.grey[400]),
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
                padding: const EdgeInsets.all(4.0),
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
                            border:
                                Border.all(width: 1.0, color: Colors.grey[400]),
                          ),
                          child: Text(
                            nextDateCtl.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
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
                    ],
                  ),
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
                      padding: EdgeInsets.only(
                          left: 50, top: 10, right: 50, bottom: 10),
                      onPressed: () async {
                        widget.medicalModel.idDog = currentDog.idDog;
                        widget.medicalModel.name = nameCtl.text;
                        widget.medicalModel.firstDate = firstDateCtl.text;
                        widget.medicalModel.nextDate = nextDateCtl.text;
                        widget.medicalModel.observation = observationCtl.text;
                        widget.medicalModel.typeMedical = 1;
                        await RestDatasourceP()
                            .medicalEditApi(
                          medicalModel: widget.medicalModel,
                          id: widget.medicalModel.idMedical,
                        )
                            .then((onValue) {
                          Navigator.pop(context);
                          // Navigator.pop(context);
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (_) => TapScreen()));
                        });
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
    );
  }

  void getData() async {
    vaccins = [];
    setState(() {
      isLoading = true;
    });
    await RestDatasourceGet()
        .getAllVaccinsByDog(id: currentDog.idDog)
        .then((val) {
      List temp = val["data"];
      print(temp);
      temp.forEach((vaccinData) {
        vaccins.add(MedicalModel.fromJson(vaccinData));
      });
      setState(() {
        isLoading = false;
      });
    });
  }
}
