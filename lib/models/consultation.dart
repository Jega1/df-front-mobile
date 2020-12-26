class AppointModel {
  int idAppoint;
  int idDog;
  int idUser;
  int idVet;
  int idVetHour;
  int available;
  String motive;

  AppointModel(
      {this.idAppoint,
      this.available,
      this.idDog,
      this.idUser,
      this.idVet,
      this.idVetHour,
      this.motive});
}
