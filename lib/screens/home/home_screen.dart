import 'package:dog_face/appColors.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/home/home_controller.dart';
import 'package:dog_face/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text('Register'),
          automaticallyImplyLeading: false,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 191, 255, .6),
                            blurRadius: 10.0,
                            offset: Offset(0, 10))
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "email",
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: requiredValidator,
                      onSaved: (val) {
                        userModel.email = val;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 191, 255, .6),
                            blurRadius: 10.0,
                            offset: Offset(0, 10))
                      ],
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: requiredValidator,
                      onSaved: (val) {
                        userModel.password = val;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(0, 191, 255, .6),
                        Color.fromRGBO(0, 191, 255, .9),
                      ])),
                  child: FlatButton(
                      padding: EdgeInsets.only(
                          left: 50, top: 10, right: 50, bottom: 10),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          authUser(userModel: userModel, context: context);
                        }
                      },
                      child: new Text(
                        "Sign in",
                        style: TextStyle(fontSize: 20, fontFamily: "Arial"),
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Inscrivez - vous',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
