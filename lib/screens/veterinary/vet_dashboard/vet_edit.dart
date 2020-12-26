import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/user.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class VetEdit extends StatefulWidget {
  @override
  _VetEditState createState() => _VetEditState();
}

class _VetEditState extends State<VetEdit> {
  bool isLoading = false;
  List vets = [];
  List<UserModel> users = [];
  TextEditingController usernameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController addressCtl = TextEditingController();
  TextEditingController codePostalCtl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailCtl.text = SharedPrefData().email;
    usernameCtl.text = SharedPrefData().username;
    passwordCtl.text = SharedPrefData().password;

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('edit user')),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'username',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: usernameCtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: EmailValidator(errorText: "format not valide"),
                  decoration: InputDecoration(
                      labelText: 'email',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: emailCtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'password',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: passwordCtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'address cabinet',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: addressCtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'code postal',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: codePostalCtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      await RestDatasourceP()
                          .editUser(
                              id: SharedPrefData().userId,
                              email: emailCtl.text,
                              username: usernameCtl.text,
                              password: passwordCtl.text,
                              address_cabinet: addressCtl.text,
                              code_postal: codePostalCtl.text)
                          .whenComplete(() {
                        SharedPrefData().setUsername(value: usernameCtl.text);
                        SharedPrefData().setEmail(value: emailCtl.text);
                        SharedPrefData().setPassword(value: passwordCtl.text);
                        // AlertDialog()
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text("register"),
                ),
              )
            ],
          ),
        ));
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getVetById(id: SharedPrefData().userId);
    addressCtl.text = res["message"][0]["address_cabinet"];
    codePostalCtl.text = res["message"][0]["code_postal"];

    setState(() {
      isLoading = false;
    });
  }
}
