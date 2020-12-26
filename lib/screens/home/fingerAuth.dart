/*
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/screens/user/user_dashboard.dart';
import 'package:dog_face/screens/veterinary/vet_dashboard/vet_dash.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerAuthPage extends StatefulWidget {
  FingerAuthPage({Key key}) : super(key: key);

  @override
  _FingerAuthPageState createState() => _FingerAuthPageState();
}

class _FingerAuthPageState extends State<FingerAuthPage> {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        color: Colors.grey,
        height: 200,
        width: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  _authenticate();
                },
                child: Icon(
                  Icons.fingerprint,
                  size: 70,
                ),
              ),
              Text("Login using fingerprint"),
            ],
          ),
        ),
      )),
    );
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
    };
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
*/