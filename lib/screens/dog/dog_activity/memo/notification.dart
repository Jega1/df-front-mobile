import 'package:dog_face/widget/menuDrawer.dart';
import 'package:flutter/material.dart';

class MemoScreen extends StatefulWidget {
  @override
  _MemoScreenState createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification")),
      drawer: MenuDrawer(),
    );
  }
}
