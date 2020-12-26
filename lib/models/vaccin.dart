import 'dart:convert';
import 'package:dog_face/datas/sharedPref.dart';

List<VaccinModel> VaccinModelFromJson(String str) => List<VaccinModel>.from(
    json.decode(str).map((x) => VaccinModel.fromJson(x)));

String VaccinModelToJson(List<VaccinModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaccinModel {
  int idVaccin;
  int idDog;
  String nameVaccin;
  String dateVaccin;
  String nextDate;
  String observation;

  VaccinModel(
      {this.idVaccin,
      this.idDog,
      this.nameVaccin,
      this.dateVaccin,
      this.nextDate,
      this.observation});

  factory VaccinModel.fromJson(Map<String, dynamic> json) => VaccinModel(
        idVaccin: json["id_vaccin"],
        idDog: json["id_dog"],
        nameVaccin: json["name_vaccin"],
        dateVaccin: json["date_vaccin"],
        nextDate: json["next_date"],
        observation: json["observation"],
      );
  Map<String, dynamic> toJson() => {
        "id_vaccin": idVaccin,
        "id_dog": idDog,
        "name_vaccin": nameVaccin,
        "date_vaccin": dateVaccin,
        "next_date": nextDate,
        "observation": observation
      };
}
