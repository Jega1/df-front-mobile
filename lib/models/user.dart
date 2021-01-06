import 'dart:convert';

// import 'dart:ffi';
List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

// String UserModelToJson(List<UserModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UserModel {
//   int idUser;
//   int isVet;
//   String username;
//   String email;
//   String password;
//   String address;
//   String codePostal;
//   String ville;
//   Double longitude;
//   Double latitude;
//   String telephone;

//   UserModel(
//       {this.idUser,
//       this.isVet,
//       this.address,
//       this.codePostal,
//       this.email,
//       this.password,
//       this.username,
//       this.ville,
//       this.longitude,
//       this.latitude,
//       this.telephone});

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         idUser: json["id_user"],
//         isVet: int.parse(json['is_veterinary']),
//         username: json["username"],
//         email: json["email"],
//         password: json["password"],
//         address: json["address"],
//         codePostal: json["codePostal"],
//         ville: json["ville"],
//         telephone: json["telephone"].toString(),
//         longitude: json["longitude"],
//         latitude: json["latitude"],
//       );
//   Map<String, dynamic> toJson() => {
//         "id_user": idUser,
//         "is_veterinay": isVet,
//         "username": username,
//         "email": email,
//         "password": password,
//         "address": address,
//         "codePostal": codePostal,
//         "telephone": telephone,
//         "longitude": longitude,
//         "latitude": latitude,
//       };
// }

class UserModel {
  int idUser;
  String isVeterinary;
  String role;
  String username;
  String email;
  String password;
  int telephone;
  String address;
  String codePostal;
  String ville;
  int longitude;
  int latitude;
  String createdAt;

  UserModel(
      {this.idUser,
      this.isVeterinary,
      this.role,
      this.username,
      this.email,
      this.password,
      this.telephone,
      this.address,
      this.codePostal,
      this.ville,
      this.longitude,
      this.latitude,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    isVeterinary = json['is_veterinary'];
    role = json['role'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    telephone = json['telephone'];
    address = json['address'];
    codePostal = json['code_postal'];
    ville = json['ville'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['is_veterinary'] = this.isVeterinary;
    data['role'] = this.role;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['telephone'] = this.telephone;
    data['address'] = this.address;
    data['code_postal'] = this.codePostal;
    data['ville'] = this.ville;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['created_at'] = this.createdAt;
    return data;
  }
}
