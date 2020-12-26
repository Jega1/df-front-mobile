import 'dart:convert';

List<PackageModel> PackageModelFromJson(String str) => List<PackageModel>.from(
    json.decode(str).map((x) => PackageModel.fromJson(x)));

String PackageModelToJson(List<PackageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackageModel {
  int idPackage;
  String description;

  PackageModel({
    this.idPackage,
    this.description,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        idPackage: json["id_package"],
        description: json["description"],
      );
  Map<String, dynamic> toJson() => {
        "id_package": idPackage,
        "description": description,
      };
}
