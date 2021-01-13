class StepsModel {
  int idStep;
  int idLesson;
  int idPackage;
  int stepOrder;
  String stepTitle;
  String description;
  String contenu;

  StepsModel(
      {this.idStep,
      this.idLesson,
      this.idPackage,
      this.stepOrder,
      this.stepTitle,
      this.description,
      this.contenu});

  StepsModel.fromJson(Map<String, dynamic> json) {
    idStep = json['id_step'];
    idLesson = json['id_lesson'];
    idPackage = json['id_package'];
    stepOrder = json['step_order'];
    stepTitle = json['step_title'];
    description = json['description'];
    contenu = json['contenu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_step'] = this.idStep;
    data['id_lesson'] = this.idLesson;
    data['id_package'] = this.idPackage;
    data['step_order'] = this.stepOrder;
    data['step_title'] = this.stepTitle;
    data['description'] = this.description;
    data['contenu'] = this.contenu;
    return data;
  }
}
