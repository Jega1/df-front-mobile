class TimeModel {
  int idAvailable;
  int idDog;
  int idVet;
  int idUser;
  int available;
  String time;

  TimeModel(
      {this.time,
      this.available,
      this.idVet,
      this.idAvailable,
      this.idUser,
      this.idDog});

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        idAvailable: json["id_available"],
        idVet: json["id_vet"],
        idDog: json["id_dog"],
        //   idUser.json["id_user"],
        available: 0,
        time: json["time"],
      );
}
