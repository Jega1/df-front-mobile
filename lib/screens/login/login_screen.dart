import 'package:dog_face/models/user.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                  validator: requiredValidator,
                  onSaved: (val) {
                    userModel.username = val;
                  },
                  decoration: InputDecoration(
                      labelText: 'email',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/** child: TextFormField(
                          initialValue: _password,
                          obscureText: passVisible,
                          onSaved: (val) => _password = val,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  !passVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passVisible = !passVisible;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              hintText: AppLocalizations.of(context)
                                  .translate("password"),
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),***/
