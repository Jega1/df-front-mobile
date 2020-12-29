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
  String addressCabinet;
  String code_postal;
  String ville;
  Double logitude;

  UserModel(
      {this.idUser,
      this.isVet,
      this.addressCabinet,
      this.code_postal,
      this.email,
      this.password,
      this.username,
      this.ville});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        isVet: 0,
        username: json["username"],
        email: json["email"],
        password: json["password"],
        addressCabinet: json["addressCabinet"],
        code_postal: json["code_postal"],
        ville: json["ville"],
      );
  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "is_veterinay": isVet,
        "username": username,
        "email": email,
        "password": password,
        "addressCabinet": addressCabinet,
        "code_postal": code_postal,
      };
}
