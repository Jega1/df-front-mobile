class TimeModel {
  int idVetHours;
  int idVet;
  int idUser;
  int available;
  String time;

  TimeModel(
      {this.time, this.available, this.idVet, this.idVetHours, this.idUser});

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        idVetHours: json["id_vet_hour"],
        idVet: json["id_vet"],
        //   idUser.json["id_user"],
        available: 0,
        time: json["time"],
      );
}
