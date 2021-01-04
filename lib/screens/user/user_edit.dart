import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/appColors.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/user/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UserEdit extends StatefulWidget {
  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  bool isLoading = false;
  List<UserModel> users = [];
  TextEditingController usernameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController addressCtl = TextEditingController();
  TextEditingController codePostalCtl = TextEditingController();
  TextEditingController villeCtl = TextEditingController();
  TextEditingController telephoneCtl = TextEditingController();

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
        appBar: AppBar(title: Text('Modifier votre profil')),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: CircleAvatar(
                      minRadius: 30,
                      maxRadius: 55,
                      child: Text('AH'),
                      // backgroundImage: NetworkImage(
                      //     'https://www.woolha.com/media/2020/03/eevee.png'),
                    )),

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
                    validator: EmailValidator(errorText: "format not valide"),
                    decoration: InputDecoration(
                        labelText: 'Telephone',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    controller: telephoneCtl,
                  ),
                ),

                //PASSWORD

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         labelText: 'password',
                //         contentPadding: new EdgeInsets.symmetric(
                //             vertical: 20.0, horizontal: 20.0),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5.0))),
                //     controller: passwordCtl,
                //   ),
                // ),

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
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'ville',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    controller: villeCtl,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          // int id = SharedPrefData().userId;
                          SharedPrefData().setUsername(value: usernameCtl.text);
                          SharedPrefData().setEmail(value: emailCtl.text);
                          SharedPrefData().setPassword(value: passwordCtl.text);
                          Map res = await RestDatasourceP().editUser(
                              id: SharedPrefData().userId,
                              email: emailCtl.text,
                              username: usernameCtl.text,
                              password: passwordCtl.text,
                              address: addressCtl.text,
                              codePostal: codePostalCtl.text,
                              ville: villeCtl.text,
                              telephone: telephoneCtl.text);
                        }
                      },
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(fontSize: 25, color: white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void getData() async {
    //username , email
    setState(() {
      isLoading = true;
    });
    Map res =
        await RestDatasourceGet().getUserById(id: SharedPrefData().userId);

    addressCtl.text = res["message"][0]["address"];
    codePostalCtl.text = res["message"][0]["code_postal"];
    villeCtl.text = res["message"][0]["ville"];
    telephoneCtl.text = res["message"][0]["telephone"];

    setState(() {
      isLoading = false;
    });
  }
}
