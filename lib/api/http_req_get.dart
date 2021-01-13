import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

String baseurl = "http://10.0.2.2:8000/api/";

class RestDatasourceGet {
  Future getUserById({int id}) async {
    String url = baseurl + "user/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future getVetById({int id}) async {
    String url = baseurl + "user/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  getAllVetApi() async {
    String url = baseurl + "vet/";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

//WHY here future not getAllVet
  Future getHoursByVet({int id}) async {
    String url = baseurl + "vet/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future getDogsByUser({int id}) async {
    String url = baseurl + "dog/user/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

//REF TABLE
  Future getAllMotif() async {
    String url = baseurl + "ref/motif";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future getAllVaccin() async {
    String url = baseurl + "ref/vaccin";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  //getDogById
  Future getDogById({int id}) async {
    String url = baseurl + "dog/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future getImagesByDogId({int id}) async {
    String url = baseurl + "dog/images/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

//APPOINTMENTS
  Future getAppointsByUser({int id}) async {
    String url = baseurl + "appoint/user/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future getAppointsByVet({int id}) async {
    String url = baseurl + "appoint/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  //VACCINS
  Future getAllVaccinsByDog({int id}) async {
    String url = baseurl + "medical/vaccin/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future getAllSicksByDog({int id}) async {
    String url = baseurl + "medical/sick/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  //TRAINING
  getAllPack() async {
    String url = baseurl + "pack/";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  getAllLessonByPackId({int id}) async {
    String url = baseurl + "pack/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }

  getAllStepsByLessonId({int id}) async {
    String url = baseurl + "lesson/$id";
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    Map res = jsonDecode(response.body);
    print(res);
    return res;
  }
}
