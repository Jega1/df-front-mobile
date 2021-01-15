import 'package:dog_face/api/http_req_get.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/appColors.dart';
import 'package:dog_face/main.dart';
import 'package:dog_face/models/step.dart';
import 'package:dog_face/models/training.dart';
import 'package:flutter/material.dart';

class StepScreen extends StatefulWidget {
  int id;
  StepScreen({this.id});

  @override
  _StepScreenState createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  bool isLoading = false;
  List allSteps = [];
  List<StepsModel> steps = [];
  ScrollController scrollController = ScrollController();

  List trainings = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('steps demo')),
      body: isLoading
          ? Center()
          : Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: steps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Steps  ${steps[index].stepOrder} '),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Steps + ${steps[index].description} ',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            index == 0
                                ? RaisedButton(
                                    onPressed: () {
                                      RestDatasourceP().trainingRegisterApi(
                                        dogId: currentDog.idDog,
                                        idLesson: steps[index].idLesson,
                                      );

                                      scrollController.jumpTo(
                                          MediaQuery.of(context).size.width *
                                                  0.95 +
                                              16);
                                    },
                                    child: Text("Start"),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      RaisedButton(
                                        onPressed: () {
                                          scrollController.jumpTo((index - 1) *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.95 +
                                              16 * (index - 1));
                                        },
                                        child: Text("Previous"),
                                      ),
                                      index == steps.length - 1
                                          ? RaisedButton(
                                              onPressed: () {
                                                RestDatasourceP()
                                                    .trainingCompleteApi(
                                                  idTraining: widget.id,
                                                  dogId: currentDog.idDog,
                                                  idLesson:
                                                      steps[index].idLesson,
                                                );
                                              },
                                              child: Text("Complete"),
                                            )
                                          : RaisedButton(
                                              onPressed: () {
                                                scrollController.jumpTo((index +
                                                            1) *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.95 +
                                                    16 * (index + 1));
                                              },
                                              child: Text("Next"),
                                            )
                                    ],
                                  )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }

  Column stepCont() {
    return Column(
      children: <Widget>[
        Container(
          height: 500,
          width: 400,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Step 1',
                style: TextStyle(fontSize: 20, color: secondColor),
              ),
              Icon(
                Icons.image,
                size: 100.0,
                color: primaryColor,
              ),
              Row(
                children: <Widget>[
                  new IconButton(
                      splashColor: primaryColor,
                      icon: new Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () {}),
                  new IconButton(
                      splashColor: primaryColor,
                      icon: new Icon(Icons.arrow_forward_ios),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: brightRed),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      //   Image(image: ),
                      Text(
                        'CLICKER',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: brightRed),
              child: FlatButton(
                  padding: EdgeInsets.all(2),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      //   Image(image: ),
                      Text(
                        "Voir l'example",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ))),
        )
      ],
    );
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getAllStepsByLessonId(id: widget.id);
    for (var item in res["message"]) {
      StepsModel stepModel = StepsModel.fromJson(item);
      steps.add(stepModel);
    }
    setState(() {
      isLoading = false;
    });
  }

  void getTrainings() async {
    setState(() {
      isLoading = true;
    });
    Map res = await RestDatasourceGet().getTrainingApi();
    for (var item in res["message"]) {
      TrainingModel trainingModel = TrainingModel.fromJson(item);

      trainings.add(trainingModel);
    }
    setState(() {
      isLoading = false;
    });
  }
}
