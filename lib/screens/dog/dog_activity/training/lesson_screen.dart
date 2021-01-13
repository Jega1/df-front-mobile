import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/models/lesson.dart';
import 'package:dog_face/models/package.dart';
import 'package:dog_face/screens/dog/dog_activity/training/step_screen.dart';
import 'package:flutter/material.dart';

import '../../../../appColors.dart';

class LessonScreen extends StatefulWidget {
  int id;
  LessonScreen({this.id});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  bool isLoading = false;
  List allpackages = [];
  List<LessonModel> lessons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les leçons'),
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return lessonContainer(model: lessons[index]);
        },
      ),
    );
  }

  Column lessonContainer({LessonModel model}) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => StepScreen(id: model.idLesson)));
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondColor.withOpacity(0.5)),
              child: ListTile(
                leading: Image.asset('assets/dog-face-5.png'),
                title: Text(
                  model.titleLesson,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: titleTextColor),
                ),
                subtitle: Text(
                  model.descriptionLesson,
                  style: TextStyle(color: titleTextColor.withOpacity(0.4)),
                ),
              ),
            ),
          ),
        ),
        Divider()
      ],
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getAllLessonByPackId(id: widget.id);
    for (var item in res["message"]) {
      LessonModel lessonModel = LessonModel.fromJson(item);
      lessons.add(lessonModel);
    }
    setState(() {
      isLoading = false;
    });
  }
}
