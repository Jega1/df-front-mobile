import 'dart:convert';
import 'dart:io';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/dog.dart';
import 'package:dog_face/models/medical.dart';
import 'package:dog_face/models/user.dart';

import 'package:http/http.dart' as http;

String baseurl = "http://10.0.2.2:8000/api/";
//String baseurl = "http://51.38.51.35:8000/api/";

class RestDatasourceP {
//USER
  userRegisterApi({
    int isVet,
    UserModel userModel,
  }) async {
    String url = baseurl + "user/register";
    Map data = {};
    if (isVet == 1) {
      data = {
        "username": userModel.username,
        "email": userModel.email,
        "password": userModel.password,
        "address_cabinet": userModel.addressCabinet,
        "code_postal": userModel.code_postal,
        "is_veterinay": "1"
      };
    } else {
      data = {
        "username": userModel.username,
        "email": userModel.email,
        "password": userModel.password,
        "is_veterinay": 0
      };
    }
    http.Response response = await http.post(url,
        body: jsonEncode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    return res;
  }

  Future userAuthenticate({String email, String password}) async {
    String url = baseurl + "user/authenticate";
    Map data = {"email": email, "password": password};
    http.Response response = await http.post(url,
        body: jsonEncode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

//DOG
  dogRegisterApi({DogModel dogModel}) async {
    String url = baseurl + "dog/register";
    http.Response response = await http.post(url,
        body: jsonEncode(dogModel.toJson()),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

  ///Vaccin
  Future vaccinRegisterApi({MedicalModel medicalModel}) async {
    String url = baseurl + "medical/add-medical";
    http.Response response = await http.post(url,
        body: jsonEncode(medicalModel.toJson()),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

//

  Future takeAppointApi({Map data}) async {
    String url = baseurl + "vet/take-appoint";
    http.Response response = await http.post(url,
        body: jsonEncode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

  Future cancelAppointApi({Map data}) async {
    String url = baseurl + "vet/cancel-appoint";
    http.Response response = await http.post(url,
        body: jsonEncode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

  Future editUser(
      {int id,
      String username,
      String email,
      String password,
      String address_cabinet,
      String code_postal}) async {
    String url = baseurl + "user/$id";
    http.Response response = await http.put(
      url,
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
        "is_veterinay": SharedPrefData().isVet,
        "address_cabinet": address_cabinet,
        "code_postal": code_postal
      }),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }
}
