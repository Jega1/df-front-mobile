import 'package:dog_face/appColors.dart';
import 'package:flutter/material.dart';

class StepScreen extends StatefulWidget {
  @override
  _StepScreenState createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('steps demo')),
      body: PageView(
        children: <Widget>[
          Column(
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
                        borderRadius: BorderRadius.circular(25),
                        color: brightRed),
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
                        borderRadius: BorderRadius.circular(25),
                        color: brightRed),
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
          ),
          Container(
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                Text('step 2'),
              ],
            ),
          ),
          Container(
            color: Colors.redAccent,
            child: Text('step 3'),
          ),
          Container(
            color: Colors.pinkAccent,
            child: Text('step 4'),
          )
        ],
      ),
    );
  }
}
