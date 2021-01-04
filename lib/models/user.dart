import 'dart:convert';

import 'dart:ffi';

List<UserModel> UserModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String UserModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int idUser;
  int isVet;
  String username;
  String email;
  String password;
  String address;
  String codePostal;
  String ville;
  Double longitude;
  Double latitude;
  String telephone;

  UserModel(
      {this.idUser,
      this.isVet,
      this.address,
      this.codePostal,
      this.email,
      this.password,
      this.username,
      this.ville,
      this.longitude,
      this.latitude,
      this.telephone});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        isVet: 0,
        username: json["username"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        codePostal: json["codePostal"],
        ville: json["ville"],
        telephone: json["telephone"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );
  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "is_veterinay": isVet,
        "username": username,
        "email": email,
        "password": password,
        "address": address,
        "codePostal": codePostal,
        "telephone": telephone,
        "longitude": longitude,
        "latitude": latitude,
      };
}
