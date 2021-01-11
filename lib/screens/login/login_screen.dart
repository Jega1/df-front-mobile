import 'package:dog_face/appColors.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/login/login_controller.dart';
import 'package:dog_face/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserModel userModel = UserModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(context);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        key: scaffoldKey,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(30),
                      bottomRight: const Radius.circular(30),
                    ),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(252, 140, 76, .9),
                      Color.fromRGBO(122, 135, 238, .9),
                    ])),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_logo(), buildContainer()],
            )
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'DOGFACE',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 25,
            color: white,
          ),
        )
        // Image.asset(
        //  // 'assets/images/logo.png',
        //   width:
        //   MediaQuery.of(context).size.width / 1.5,
        //   fit: BoxFit.fill, color: Colors.white,
        // ),
      ],
    );
  }

  Widget buildContainer() {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                          ),
                        )
                      ],
                    ),
                    _buildEmailRow(),
                    _buildPasswordRow(),
                    _buildForgetPasswordButton(),
                    _buildLoginButton(),
                    _buildSingupBtn(),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // onChanged: (value){
          //   setState(() {
          //     email = value;
          //   });
          // },
          validator: requiredValidator,
          onSaved: (val) {
            userModel.email = val;
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email, color: primaryColor),
              labelText: "E-mail"),
        ));
  }

  Widget _buildPasswordRow() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          // onChanged: (value){

          //   setState(() {
          //     password = value;
          //   });
          // },

          validator: requiredValidator,
          onSaved: (val) {
            userModel.password = val;
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: primaryColor),
              labelText: "password"),
        ));
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [FlatButton(onPressed: () {}, child: Text('Forget password'))],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                authUser(userModel: userModel, context: context);
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: primaryColor,
                  letterSpacing: 1,
                  fontSize: MediaQuery.of(context).size.height / 40),
            ),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
        )
      ],
    );
  }

  Widget _builOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '-OR-',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ))
      ],
    );
  }

  Widget _buildSingupBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: RichText(
                  text: TextSpan(children: [
                // TextSpan(text: "Vous n'avez pas de compte ?",
                // style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height/40
                // )),
                TextSpan(
                    text: 'Inscrivez - vous',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: MediaQuery.of(context).size.height / 35))
              ]))),
        )
      ],
    );
  }
}
