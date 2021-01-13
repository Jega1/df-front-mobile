class LessonModel {
  int idLesson;
  int idPackage;
  String titleLesson;
  String descriptionLesson;

  LessonModel(
      {this.idLesson,
      this.idPackage,
      this.titleLesson,
      this.descriptionLesson});

  LessonModel.fromJson(Map<String, dynamic> json) {
    idLesson = json['id_lesson'];
    idPackage = json['id_package'];
    titleLesson = json['title_lesson'];
    descriptionLesson = json['description_lesson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_lesson'] = this.idLesson;
    data['id_package'] = this.idPackage;
    data['title_lesson'] = this.titleLesson;
    data['description_lesson'] = this.descriptionLesson;
    return data;
  }
}
