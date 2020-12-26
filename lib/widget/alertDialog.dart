import 'package:flutter/material.dart';

Future buildShowDialog({
  BuildContext context,
  String title,
  String buttonText = "Ok",
  Function func,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      actions: <Widget>[
        RaisedButton(
          onPressed: func,
          child: Text(buttonText),
        )
      ],
    ),
  );
}
