// import 'package:dog_face/api/http_req_post.dart';
// import 'package:dog_face/main.dart';
// import 'package:dog_face/models/medical.dart';
// import 'package:dog_face/models/vaccin.dart';
// import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/vaccin/add_vaccin.dart';
// import 'package:dog_face/screens/dog/doc_activity/carnet_sante/carnet_tap/vaccin/edit_vaccin.dart';
// import 'package:flutter/material.dart';
// import 'package:dog_face/api/http_req_get.dart';

// class ListVaccin extends StatefulWidget {
//   @override
//   _ListVaccinState createState() => _ListVaccinState();
// }

// class _ListVaccinState extends State<ListVaccin> {
//   bool isLoading = false;
//   List<MedicalModel> vaccins = [];

//   @override
//   void initState() {
//     getData();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : vaccins.length == 0
//               ? Center(
//                   child: Text("Ajouter votre chien"),
//                 )
//               : ListView.builder(
//                   itemCount: vaccins.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return GestureDetector(
//                       onTap: () async {
//                         setState(() {});

//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (_) => EditVaccinScreen(MedicalModel)));
//                       },
//                       child: ListTile(
//                         title: Text(vaccins[index].name),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(vaccins[index].firstDate),
//                             Text(vaccins[index].nextDate),
//                           ],
//                         ),
//                         leading: Icon(Icons.info_outline),
//                         trailing: Text(vaccins[index].firstDate),
//                       ),
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (_) => AddVaccin()))
//               .whenComplete(() {
//             getData();
//           });
//           // Get.to(AddVaccin());
//         },
//         child: Icon(Icons.add),
//         //  backgroundColor: primaryColor,
//       ),
//     );
//   }

//   void getData() async {
//     vaccins = [];
//     setState(() {
//       isLoading = true;
//     });
//     await RestDatasourceGet()
//         .getAllVaccinsByDog(id: currentDog.idDog)
//         .then((val) {
//       List temp = val["data"];
//       temp.forEach((vaccinData) {
//         vaccins.add(MedicalModel.fromJson(vaccinData));
//       });
//       setState(() {
//         isLoading = false;
//       });
//     });
//   }
// }
