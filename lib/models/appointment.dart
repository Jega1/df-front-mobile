// class AppointModel {
//   int idAppoint;
//   int idDog;
//   int idUser;
//   int idVet;
//   int idVetHour;
//   int available;
//   String motive;

//   AppointModel(
//       {this.idAppoint,
//       this.available,
//       this.idDog,
//       this.idUser,
//       this.idVet,
//       this.idVetHour,
//       this.motive});
// }

class AppointModel {
  int idAppointment;
  int idUser;
  int idDog;
  int idAvailable;
  int idVet;
  String motif;
  String createdAt;
  String firstname;
  String lastname;
  String sex;
  String race;
  String puceNu;
  String birthDate;
  String birthCertificateNu;
  String passportNu;
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

  AppointModel(
      {this.idAppointment,
      this.idUser,
      this.idDog,
      this.idAvailable,
      this.idVet,
      this.motif,
      this.createdAt,
      this.firstname,
      this.lastname,
      this.sex,
      this.race,
      this.puceNu,
      this.birthDate,
      this.birthCertificateNu,
      this.passportNu,
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
      this.latitude});

  AppointModel.fromJson(Map<String, dynamic> json) {
    idAppointment = json['id_appointment'];
    idUser = json['id_user'];
    idDog = json['id_dog'];
    idAvailable = json['id_available'];
    idVet = json['id_vet'];
    motif = json['motif'];
    createdAt = json['created_at'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    sex = json['sex'];
    race = json['race'];
    puceNu = json['puce_nu'];
    birthDate = json['birth_date'];
    birthCertificateNu = json['birth_certificate_nu'];
    passportNu = json['passport_nu'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_appointment'] = this.idAppointment;
    data['id_user'] = this.idUser;
    data['id_dog'] = this.idDog;
    data['id_available'] = this.idAvailable;
    data['id_vet'] = this.idVet;
    data['motif'] = this.motif;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['sex'] = this.sex;
    data['race'] = this.race;
    data['puce_nu'] = this.puceNu;
    data['birth_date'] = this.birthDate;
    data['birth_certificate_nu'] = this.birthCertificateNu;
    data['passport_nu'] = this.passportNu;
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
    return data;
  }
}
