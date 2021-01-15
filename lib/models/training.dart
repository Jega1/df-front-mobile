class TrainingModel {
  int idTrainning;
  int idDog;
  int idLesson;
  int idStatus;
  String periode;
  String note;

  TrainingModel(
      {this.idTrainning,
      this.idDog,
      this.idLesson,
      this.idStatus,
      this.periode,
      this.note});

  TrainingModel.fromJson(Map<String, dynamic> json) {
    idTrainning = json['id_trainning'];
    idDog = json['id_dog'];
    idLesson = json['id_lesson'];
    idStatus = json['id_status'];
    periode = json['periode'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_trainning'] = this.idTrainning;
    data['id_dog'] = this.idDog;
    data['id_lesson'] = this.idLesson;
    data['id_status'] = this.idStatus;
    data['periode'] = this.periode;
    data['note'] = this.note;
    return data;
  }
}