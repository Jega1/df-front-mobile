import 'dart:convert';

import 'package:dog_face/datas/sharedPref.dart';

List<DogModel> DogModelFromJson(String str) =>
    List<DogModel>.from(json.decode(str).map((x) => DogModel.fromJson(x)));

String DogModelToJson(List<DogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DogModel {
  int idDog;
  String firstname;
  String lastname;
  String sex;
  String race;
  String puceNu;
  //String convertedDate;
  String birthCertificateNu;
  String birthDate;
  String passportNu;
  List img;

  DogModel(
      {this.idDog,
      this.firstname,
      this.lastname,
      this.sex,
      this.race,
      this.puceNu,
      this.birthDate,
      this.birthCertificateNu,
      this.passportNu,
      this.img});

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
      idDog: json["id_dog"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      sex: json["sex"],
      race: json["race"],
      puceNu: json["puce_nu"],
      birthDate: json["birth_date"],
      birthCertificateNu: json["birth_certificate_nu"],
      passportNu: json["passport_nu"],
      img: json['images']);
  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "sex": sex,
        "race": race,
        "puce_nu": puceNu,
        "birth_date": birthDate,
        "birth_certificate_nu": birthCertificateNu,
        "passport_nu": passportNu,
        "images": img,
        "id_user": SharedPrefData().userId
      };
}
