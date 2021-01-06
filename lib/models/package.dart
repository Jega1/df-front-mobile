class PackageModel {
  int idPackage;
  String namePackage;
  String description;
  String idStatus;

  PackageModel(
      {this.idPackage, this.namePackage, this.description, this.idStatus});

  PackageModel.fromJson(Map<String, dynamic> json) {
    idPackage = json['id_package'];
    namePackage = json['name_package'];
    description = json['description'];
    idStatus = json['id_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_package'] = this.idPackage;
    data['name_package'] = this.namePackage;
    data['description'] = this.description;
    data['id_status'] = this.idStatus;
    return data;
  }
}
