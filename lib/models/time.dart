class TimeModel {
  int idVetHours;
  int idVet;
  int available;
  String time;

  TimeModel({this.time, this.available, this.idVet, this.idVetHours});

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        idVetHours: json["id_vet_hour"],
        idVet: json["id_vet"],
        available: 0,
        time: json["time"],
      );
}
