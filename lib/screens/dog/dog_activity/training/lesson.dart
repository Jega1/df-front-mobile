import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
  LessonScreen({Key key}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les leçons'),
      ),
    );
  }
}
