import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UserEdit extends StatefulWidget {
  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController usernameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController adressCtl = TextEditingController();
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
                child: FlatButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      int id = SharedPrefData().userId;
                      await RestDatasourceP().editUser(
                          id: id,
                          email: emailCtl.text,
                          username: usernameCtl.text,
                          password: passwordCtl.text,
                          address_cabinet: " ",
                          code_postal: " ");
                    }
                  },
                  child: Text("register"),
                ),
              )
            ],
          ),
        ));
  }

  void getData() {
    //username , email
  }
}
