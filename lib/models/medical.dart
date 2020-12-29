import 'dart:convert';

List<MedicalModel> MedicalModelFromJson(String str) => List<MedicalModel>.from(
    json.decode(str).map((x) => MedicalModel.fromJson(x)));

String VaccinModelToJson(List<MedicalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalModel {
  int idMedical;
  int idDog;
  String name;
  String firstDate;
  String nextDate;
  String observation;
  String treatment;
  int typeMedical;

  MedicalModel(
      {this.idMedical,
      this.idDog,
      this.name,
      this.firstDate,
      this.nextDate,
      this.observation,
      this.treatment,
      this.typeMedical});

  factory MedicalModel.fromJson(Map<String, dynamic> json) => MedicalModel(
        idMedical: json["id_medical"],
        idDog: json["id_dog"],
        name: json["name"],
        firstDate: json["first_date"],
        nextDate: json["next_date"],
        observation: json["observation"],
        treatment: json["treatement"],
        typeMedical: 0,
      );
  Map<String, dynamic> toJson() => {
        "id_medical": idMedical,
        "id_dog": idDog,
        "name": name,
        "firstDate": firstDate,
        "next_date": nextDate,
        "observation": observation,
        "treatment": observation,
        "typeMedical": typeMedical
      };
}
