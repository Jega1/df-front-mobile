import 'package:dog_face/appColors.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/login/login_screen.dart';
import 'package:dog_face/screens/user/user_dashboard.dart';
import 'package:dog_face/screens/veterinary/vet_dashboard/vet_dash.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:local_auth/local_auth.dart';

class FingerAuthPage extends StatefulWidget {
  @override
  _FingerAuthPageState createState() => _FingerAuthPageState();
}

class _FingerAuthPageState extends State<FingerAuthPage> {
  final LocalAuthentication auth = LocalAuthentication();
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
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(30),
                      bottomRight: const Radius.circular(30),
                    ),
                    gradient: LinearGradient(colors: [
                      //  Color.fromRGBO(0,	92,	63, .9),
                      Color.fromRGBO(122, 12, 40, .9),
                      // Color.fromRGBO(	255,	99,	97,  .9),
                      Color.fromRGBO(2, 24, 101, .9),
                    ])),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logo(),
                connect(),
              ],
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

  Widget connect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(17, 191, 255, .9),
                      // blurRadius: 10.0,
                      // offset: Offset(0, 10)
                    )
                  ],
                  color: Colors.white,
                ),
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Se connecter',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Arial",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: GestureDetector(
                  onTap: () {
                    _authenticate();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      //  Color.fromRGBO(0,	92,	63, .9),
                      Color.fromRGBO(122, 12, 40, .9),
                      // Color.fromRGBO(	255,	99,	97,  .9),
                      Color.fromRGBO(2, 24, 101, .9),
                    ])),
                    child: Icon(
                      Icons.fingerprint,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _forgetPassword() {
    return Container(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 2,
        child: new Text("Mot de passe oublié ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black38,
                //color: DarkGrey,
                fontFamily: "Arial",
                fontSize: 20)));
  }

  Widget _register() {
    return Container(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              //  Color.fromRGBO(0,	92,	63, .9),
              Color.fromRGBO(122, 12, 40, .9),
              // Color.fromRGBO(	255,	99,	97,  .9),
              Color.fromRGBO(2, 24, 101, .9),
            ])),
        child: new Text('Inscrivez - vous',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                //color: DarkGrey,
                fontFamily: "Arial",
                fontSize: 20)));
  }

  navigatePage() {
    if (SharedPrefData().isVet == "1") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VetDashboard(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDashboard(),
          ));
    }
    ;
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      await auth
          .authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        // stickyAuth: true,
      )
          .then((onValue) {
        print(onValue);
        if (onValue) {
          navigatePage();
        }
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      // _authorized = message;
    });
  }
}
