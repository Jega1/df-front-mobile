import 'package:dog_face/models/medical.dart';
import 'package:dog_face/models/vaccin.dart';
import 'package:flutter/material.dart';

import '../../../../../../appColors.dart';

class EditVaccinScreen extends StatefulWidget {
  final MedicalModel;
  EditVaccinScreen(this.MedicalModel);

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
  List<VaccinModel> vaccins = [];
  List<MedicalModel> medicals = [];
  bool isLoading = false;

  void initState() {
    super.initState();
    nameCtl.text = MedicalModel().name;
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
                child: TextFormField(
                  //    validator: requiredValidator,
                  // onSaved: (val) {
                  //   dogModel.birthCertificateNu = val;
                  // },
                  decoration: InputDecoration(
                      labelText: "name vaccin",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: nameCtl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
