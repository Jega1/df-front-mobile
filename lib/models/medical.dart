import 'dart:convert';

List<MedicalModel> medicalModelFromJson(String str) => List<MedicalModel>.from(
    json.decode(str).map((x) => MedicalModel.fromJson(x)));

// String VaccinModelToJson(List<MedicalModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalModel {
  int idMedical;
  int idDog;
  String name;
  String firstDate;
  String nextDate;
  String treatment;
  String observation;
  int typeMedical;

  MedicalModel(
      {this.idMedical,
      this.idDog,
      this.name,
      this.firstDate,
      this.nextDate,
      this.treatment,
      this.observation,
      this.typeMedical});

  MedicalModel.fromJson(Map<String, dynamic> json) {
    idMedical = json['id_medical'];
    idDog = json['id_dog'];
    name = json['name'];
    firstDate = json['first_date'];
    nextDate = json['next_date'];
    treatment = json['treatment'];
    observation = json['observation'];
    typeMedical = json['type_medical'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_medical'] = this.idMedical;
    data['id_dog'] = this.idDog;
    data['name'] = this.name;
    data['first_date'] = this.firstDate;
    data['next_date'] = this.nextDate;
    data['treatment'] = this.treatment;
    data['observation'] = this.observation;
    data['type_medical'] = this.typeMedical;
    return data;
  }
}
