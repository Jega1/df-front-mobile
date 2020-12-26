import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefData {
  static final SharedPrefData _instance = SharedPrefData._ctor();

  factory SharedPrefData() {
    return _instance;
  }

  SharedPrefData._ctor();
  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
    print("shared preference instance created======");
  }

  reset() {
    _prefs.clear();
  }

  get email {
    return _prefs.getString('email') ?? ' ';
  }

  setEmail({String value}) {
    return _prefs.setString('email', value);
  }

  get username {
    return _prefs.getString('username') ?? ' ';
  }

  setUsername({@required String value}) {
    return _prefs.setString('username', value);
  }

  get password {
    return _prefs.getString('password') ?? ' ';
  }

  setPassword({@required String value}) {
    return _prefs.setString('password', value);
  }

  get userId {
    return _prefs.getInt('userId') ?? -1;
  }

  setUserId({int value}) {
    return _prefs.setInt('userId', value);
  }

  get vetId {
    return _prefs.getInt('vetId') ?? -1;
  }

  setVetId({@required int value}) {
    return _prefs.setInt('VetId', value);
  }

  get isVet {
    return _prefs.getString('isVet') ?? ' ';
  }

  setIsVet({String value}) {
    return _prefs.setString('isVet', value);
  }

//BIOMETRIC
  getApprovedAuth() {
    return _prefs.getInt("fingerPrint") ?? -1;
  }

  setApprovedAuth({int val}) {
    return _prefs.setInt("fingerPrint", val);
  }
}
