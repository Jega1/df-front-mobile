import 'package:dog_face/api/http_req_get.dart';
import 'package:flutter/material.dart';

// showSelectPieceDialog(BuildContext context) {
//   List dogs = [];
//   TextEditingController addPiece = TextEditingController();
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return FutureBuilder(
//           future: RestDatasourceGet().getDogsByUser(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) pieceR = snapshot.data;
//             return SimpleDialog(
//               title: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: addPiece,
//                     ),
//                   ),
//                   FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedPiece = addPiece.text;
//                       });
//                       Navigator.pop(context);
//                     },
//                     color: primaryColor,
//                     child: Text(
//                       AppLocalizations.of(context).translate("add"),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//               children: snapshot.hasData
//                   ? pieceR
//                       .map((e) => ListTile(
//                             title: Text(e),
//                             onTap: () {
//                               setState(() {
//                                 addPiece.text = e;
//                               });
//                             },
//                           ))
//                       .toList()
//                   : [
//                       Center(
//                         child: CircularProgressIndicator(
//                           valueColor:
//                               AlwaysStoppedAnimation<Color>(Colors.purple),
//                           strokeWidth: 5,
//                         ),
//                       )
//                     ],
//             );
//           });
//     },
//   );
// }
