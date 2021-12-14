// import 'package:cloud_firestore/cloud_firestore.dart';
// import "package:flutter/material.dart";

// import 'package:sanket/model/category.dart';
// import 'package:sanket/model/productslider.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class getListview extends StatelessWidget {
//   // const ({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//   }
// }

// class getListview extends StatelessWidget {
//   var firestoreDB =
//       FirebaseFirestore.instance.collection("cropList").snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: StreamBuilder(
//         stream: firestoreDB,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return CircularProgressIndicator();
//           return ListView.builder(
//             itemCount: (snapshot.data! as QuerySnapshot).docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               // String sank =snapshot.data! as QuerySnapshot).docs[index]['nurseryName']
//               List agventure =
//                   (snapshot.data! as QuerySnapshot).docs[index]["Agventure"];
//               // String Sank =
//               //     "${(snapshot.data! as QuerySnapshot).docs[index]['nurseryName']}";
//               // // List agro = (snapshot.data! as QuerySnapshot).docs[index]["Agro"];
//               return SingleChildScrollView(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30)),
//                   elevation: 40,
//                   shadowColor: Colors.green,
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     height: 100,
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             // print("${Sank}");
//                             Navigator.pushNamed(context, "/xyz",
//                                 arguments: Crop(agventure));
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Center(
//                                 child: Text(
//                                     "${(snapshot.data! as QuerySnapshot).docs[index]['nurseryName']}",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold)),
//                               ),
//                               Text(
//                                 "${(snapshot.data! as QuerySnapshot).docs[index]['Location']}",
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 18,
//                                     fontStyle: FontStyle.italic),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
