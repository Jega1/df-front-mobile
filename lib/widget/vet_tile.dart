import 'package:flutter/material.dart';
import '../models/user.dart';

class VetListTile extends StatelessWidget {
  final UserModel userModel;
  final Function action;

  VetListTile({this.userModel, this.action, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: action,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.home,
                  //color: Color.ambe,
                ),
                // backgroundColor: pinkDark,
              ),
              //isThreeLine: true,
              title: Text(
                userModel.username,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userModel.address,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  Text(
                    userModel.codePostal,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  // Text(
                  //   bien.ville,
                  //   style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  // ),
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
