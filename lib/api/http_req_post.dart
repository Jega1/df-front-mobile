import 'dart:convert';
import 'dart:io';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/main.dart';
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
    print(isVet);

    data = {
      "username": userModel.username,
      "email": userModel.email,
      "password": userModel.password,
      "address": userModel.address,
      "codePostal": userModel.codePostal,
      "ville": userModel.ville,
      "telephone": userModel.telephone,
      "longitude": userModel.longitude,
      "latitude": userModel.latitude,
      "is_veterinary": userModel.isVeterinary
    };
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

//EDIT user

  Future editUser({
    int id,
    String username,
    String email,
    String password,
    String address,
    String codePostal,
    String ville,
    String telephone,
  }) async {
    String url = baseurl + "user/$id";
    http.Response response;
    try {
      response = await http.put(
        url,
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
          "is_veterinay": SharedPrefData().isVet,
          "address": address,
          "code_postal": codePostal,
          "ville": ville,
          "telephone": telephone,
        }),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
    } catch (e) {
      print(e);
    }
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

  dogEditApi({DogModel dogModel}) async {
    String url = baseurl + "dog/${dogModel.idDog}";
    Map data = dogModel.toJson();
    http.Response response = await http.put(url,
        body: jsonEncode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

  //image
  //! Fix this api
  uplodeImage({File image, int id}) async {
    String url = baseurl + "dog/add-dog-image";
    var postUri = Uri.parse(url);
    var request = new http.MultipartRequest("POST", postUri);
    final imagefile = await http.MultipartFile.fromPath("dogImage", image.path);
    request.files.add(imagefile);
    request.fields["id_dog"] = id.toString();
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      Map res = json.decode(response.body);
      return res;
    } catch (e) {}
  }

  ///Vaccin
  Future medicalRegisterApi({MedicalModel medicalModel}) async {
    String url = baseurl + "medical/add-medical";
    http.Response response = await http.post(url,
        body: jsonEncode(medicalModel.toJson()),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

  Future medicalEditApi({int id, MedicalModel medicalModel}) async {
    String url = baseurl + "medical/edit-medical/$id";
    http.Response response = await http.put(url,
        body: jsonEncode(medicalModel.toJson()),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

  Future medicalDeleteApi({int id}) async {
    String url = baseurl + "medical/$id";
    http.Response response = await http
        .put(url, headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

//APPOINTMENT

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
    print(data);
    http.Response response = await http.post(url,
        body: jsonEncode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

  Future trainingStartApi(
      {int id_dog, int id_lesson, int id_status, String note}) async {
    String url = baseurl + "trainning";
    http.Response response = await http.post(url,
        body: jsonEncode({
          "id_dog": currentDog.idDog,
          "id_lesson": id_lesson,
          "id_staus": id_status,
          "note": note
        }),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    Map res = jsonDecode(response.body);
    print(res);
  }

//

  // Future editUsereeeeeee(
  //     {int id,
  //     String username,
  //     String email,
  //     String password,
  //     String address_cabinet,
  //     String code_postal,
  //     String ville}) async {
  //   String url = baseurl + "user/$id";
  //   http.Response response = await http.put(
  //     url,
  //     body: jsonEncode({
  //       "username": username,
  //       "email": email,
  //       "password": password,
  //       "is_veterinay": SharedPrefData().isVet,
  //       "address_cabinet": address_cabinet,
  //       "code_postal": code_postal,
  //       "ville": ville,
  //     }),
  //     headers: {HttpHeaders.contentTypeHeader: "application/json"},
  //   );
  //   Map res = jsonDecode(response.body);
  //   print(res);
  //   return res;
  // }
}
