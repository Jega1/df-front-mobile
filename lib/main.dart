import 'package:dog_face/models/dog.dart';
import 'package:dog_face/screens/home/wellcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appColors.dart';
import 'datas/sharedPref.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

SharedPreferences prefs;
DogModel currentDog;

void main() async {
  currentDog = null;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: new ThemeData(
        //primaryColor: primaryColor,
        primaryColor: primaryColor,
      ),

      home: WellcomeScreen(),
      // routes: {},
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => Home(),
      //   );
      // },
    );
  }

  void getData() async {
    await SharedPrefData().init();
  }
}
