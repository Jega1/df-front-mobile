import 'package:dog_face/api/http_req_post.dart';
import 'package:dog_face/datas/sharedPref.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/user/user_dashboard.dart';
import 'package:dog_face/screens/veterinary/vet_dashboard/vet_dash.dart';
import 'package:dog_face/widget/alertDialog.dart';
import 'package:flutter/material.dart';

authUser({
  BuildContext context,
  UserModel userModel,
}) async {
  await RestDatasourceP()
      .userAuthenticate(email: userModel.email, password: userModel.password)
      .then((val) {
    if (val["success"]) {
      SharedPrefData().setEmail(value: userModel.email);
      SharedPrefData().setPassword(value: userModel.password);
      //   SharedPrefData().setUserId(value: userModel.idUser);
      SharedPrefData().setUserId(value: val["data"]["user"]["0"]["id_user"]);
      SharedPrefData().setUsername(value: val["data"]["user"]["0"]["username"]);
      //    SharedPrefData().setUsername(value: userModel.username);
      SharedPrefData()
          .setIsVet(value: val["data"]["user"]["0"]["is_veterinay"]);
    }
    if (val["success"]) {
      int isApproved = SharedPrefData().getApprovedAuth();
      if (isApproved == -1) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Use fingerprint?"),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  SharedPrefData().setApprovedAuth(val: 1);
                  Navigator.pop(context);
                  val["data"]["user"]["0"]["is_veterinay"] == "1"
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VetDashboard(),
                          ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDashboard(),
                          ));
                },
                child: Text("yes"),
              ),
              RaisedButton(
                onPressed: () {
                  SharedPrefData().setApprovedAuth(val: 0);
                  Navigator.pop(context);
                  val["data"]["user"]["0"]["is_veterinay"] == "1"
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VetDashboard(),
                          ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDashboard(),
                          ));
                },
                child: Text("No"),
              ),
            ],
          ),
        );
      } else {
        SharedPrefData().setApprovedAuth(val: 1);
        Navigator.pop(context);
        val["data"]["user"]["0"]["is_veterinay"] == "1"
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VetDashboard(),
                ))
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDashboard(),
                ));
      }
    } else {
      print("i am here");
      buildShowDialog(
          context: context,
          func: () {
            // Navigator.pop(context);
          },
          title: val["message"]);
    }
  });
}
