import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/main.dart';
import 'package:dog_face/models/medical.dart';
import 'package:dog_face/models/vaccin.dart';
import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/vaccin/list_vaccin.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../../../../appColors.dart';
import '../tap.dart';

class AddVaccin extends StatefulWidget {
  @override
  _AddVaccinState createState() => _AddVaccinState();
}

class _AddVaccinState extends State<AddVaccin> {
  final _formKey = GlobalKey<FormState>();
  //VaccinModel vaccinModel = VaccinModel();
  MedicalModel medicalModel = MedicalModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  TextEditingController nameCtl = TextEditingController();
  TextEditingController firstDateCtl = TextEditingController();
  TextEditingController nextDateCtl = TextEditingController();
  TextEditingController observationCtl = TextEditingController();

  DateTime now = DateTime.now();
  List<VaccinModel> vaccins = [];
  List<MedicalModel> medicals = [];
  bool isLoading = false;

  String selectedVaccin = '';
  String convertedDate = "";

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add vaccin')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.plus_one,
                      size: 20.0,
                      color: primaryColor,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "selectioner un vaccin ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1.0, color: Colors.grey[400]),
                    ),
                    child: Text(
                      selectedVaccin.isEmpty ? ' ' : selectedVaccin,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onTap: () {
                    showSelectVaccinDialog(context);
                  },
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
                      gradient: LinearGradient(colors: [
                        // Color.fromRGBO(143, 148,251,.1),
                        Color.fromRGBO(0, 191, 255, .6),
                        Color.fromRGBO(0, 191, 255, .9),
                      ])),
                  child: FlatButton(
                      padding: EdgeInsets.only(
                          left: 50, top: 10, right: 50, bottom: 10),
                      onPressed: () async {
                        medicalModel.idDog = currentDog.idDog;
                        medicalModel.name = selectedVaccin;
                        medicalModel.firstDate = firstDateCtl.text;
                        medicalModel.nextDate = nextDateCtl.text;
                        medicalModel.observation = observationCtl.text;
                        medicalModel.typeMedical = 1;
                        await RestDatasourceP()
                            .medicalRegisterApi(
                          medicalModel: medicalModel,
                        )
                            .then((onValue) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => TapScreen()));
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

  showSelectVaccinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: nameCtl,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      selectedVaccin = nameCtl.text;
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
            children: vaccins
                .map((e) => ListTile(
                      title: Text(e.nameVaccin),
                      onTap: () {
                        setState(() {
                          nameCtl.text = e.nameVaccin;
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
    vaccins = [];
    Map res = await RestDatasourceGet().getAllVaccin();
    List data = res["message"];
    print(data);
    for (var item in data) {
      vaccins.add(VaccinModel(
          idVaccin: item["id_vaccin"], nameVaccin: item["name_vaccin"]));
      setState(() {
        isLoading = false;
      });
    }
  }
}
