import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/screens/home/finger.dart';
import 'package:dog_face/screens/login/login_screen.dart';
import 'package:dog_face/screens/user/user_dashboard.dart';
import 'package:dog_face/screens/veterinary/vet_dashboard/vet_dash.dart';
import 'package:flutter/material.dart';

import '../../appColors.dart';

class WellcomeScreen extends StatefulWidget {
  @override
  _WellcomeScreenState createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('assets/logo-dog-face.png'),
          fit: BoxFit.contain,
        ),
        color: secondColor,
        boxShadow: [
          BoxShadow(color: lightBlack, blurRadius: 5, offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text('Splash screen ici wellcome screen')),
    ));
  }

  void getData() async {
    await Future.delayed(Duration(seconds: 2)).then((onValue) async {
      if (SharedPrefData().userId != -1) {
        int isAuthReq = SharedPrefData().getApprovedAuth();
        if (isAuthReq == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FingerAuthPage(),
            ),
          );
        } else {
          navigatePage();
        }
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
    });
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
  }
}
