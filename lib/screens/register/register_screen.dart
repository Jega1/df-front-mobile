import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/login/login_screen.dart';
import 'package:dog_face/widget/alertDialog.dart';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../appColors.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String dropdownValue = 'Veterinaire';
  List<String> _typeUser = ['Veterinaire', 'Properietaire', 'Eleveur'];
  String _selectedUser;

  final _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                // CircleAvatar(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Créer un compte",
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    overflow: TextOverflow.fade,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.black38),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Text(
                          'Selectionez type de user',
                          style: new TextStyle(
                              fontSize: 17.0, color: Colors.black54),
                        ), // Not necessary for Option 1
                        value: _selectedUser,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedUser = newValue;
                          });
                        },
                        items: _typeUser.map((typeUser) {
                          return DropdownMenuItem(
                            child: new Text(typeUser),
                            value: typeUser,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: requiredValidator,
                    onSaved: (val) {
                      userModel.username = val;
                    },
                    decoration: InputDecoration(
                        labelText: 'username',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller: ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: EmailValidator(errorText: "format not valide"),
                    onSaved: (val) {
                      userModel.email = val;
                    },
                    decoration: InputDecoration(
                        labelText: 'email',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller: ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: requiredValidator,
                    onSaved: (val) {
                      userModel.password = val;
                    },
                    decoration: InputDecoration(
                        labelText: 'password',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller: ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (val) {
                      userModel.telephone = int.parse(val);
                    },
                    decoration: InputDecoration(
                        labelText: 'telephone',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller: ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: requiredValidator,
                    onSaved: (val) {
                      userModel.address = val;
                    },
                    decoration: InputDecoration(
                        labelText: 'Address',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller: ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: requiredValidator,
                    onSaved: (val) {
                      userModel.codePostal = val;
                    },
                    decoration: InputDecoration(
                        labelText: 'code postal',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller: ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: requiredValidator,
                    onSaved: (val) {
                      userModel.ville = val;
                    },
                    decoration: InputDecoration(
                        labelText: 'ville',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    //controller: ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        padding: EdgeInsets.only(
                            left: 50, top: 10, right: 50, bottom: 10),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            print(userModel.email);
                            userModel.isVeterinary =
                                _selectedUser == 'Veterinaire'
                                    ? 1.toString()
                                    : 0.toString();
                            Map res = await RestDatasourceP().userRegisterApi(
                              isVet: _selectedUser == 'Veterinaire' ? 1 : 0,
                              userModel: userModel,
                            );
                            if (res["success"]) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                              buildShowDialog(
                                  context: context,
                                  title:
                                      "Votre demande bien enregistre connectez -vous",
                                  func: () {
                                    Navigator.pop(context);
                                  });
                            } else {
                              buildShowDialog(
                                  context: context,
                                  title: res["message"],
                                  func: () {
                                    Navigator.pop(context);
                                  });
                            }
                          }
                        },
                        child: new Text(
                          "Créer un compte",
                          style: TextStyle(
                              fontSize: 20, fontFamily: "Arial", color: white),
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
