import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:sanket/app_screen/productdetail.dart';
import 'package:sanket/app_screen/utils.dart';

class getListview extends StatelessWidget {
  var firestoreDB =
      FirebaseFirestore.instance.collection("cropList").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: firestoreDB,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: (snapshot.data! as QuerySnapshot).docs.length,
            itemBuilder: (BuildContext context, int index) {
              // String sank =snapshot.data! as QuerySnapshot).docs[index]['nurseryName']
              List agventure =
                  (snapshot.data! as QuerySnapshot).docs[index]["Agventure"];
              // String Sank =
              //     "${(snapshot.data! as QuerySnapshot).docs[index]['nurseryName']}";
              // // List agro = (snapshot.data! as QuerySnapshot).docs[index]["Agro"];
              return SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 40,
                  shadowColor: Colors.green,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // print("${Sank}");
                            Navigator.pushNamed(context, "/xyz",
                                arguments: Crop(agventure));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                    "${(snapshot.data! as QuerySnapshot).docs[index]['nurseryName']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                "${(snapshot.data! as QuerySnapshot).docs[index]['Location']}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}




// Widget plantList(String Name, String image) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("plant Data"),
//     ),
//     body: ListView.builder(
//         itemCount: 2,
//         itemBuilder: (BuildContext context, int index) {
//           return SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Container(
//               child: new FittedBox(
//                 child: Material(
//                     color: Colors.white,
//                     elevation: 14.0,
//                     borderRadius: BorderRadius.circular(24.0),
//                     shadowColor: Color(0x802196F3),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 16.0),
//                             child: Text(Name),
//                           ),
//                         ),
//                         Container(
//                           width: 250,
//                           height: 200,
//                           child: ClipRRect(
//                             borderRadius: new BorderRadius.circular(24.0),
//                             child: Image(
//                               fit: BoxFit.contain,
//                               alignment: Alignment.topRight,
//                               image: NetworkImage(image),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ),
//           );
//         }),
//   );
// }
 // static List<String> nursery = [
  //   "Tanuja hightech nursery ",
  //   "Sahyadri Farma nursery ",
  //   // "Abhishek hightech nursery ",
  //   // "Tanuja Nursery",
  //   // "Green Valley Nursery",
  //   // "Shradha nurserey",
  //   // "Sugandha Farm Nursery"
  // ];
  // static List<String> Location = [
  //   "Uran",
  //   "Panvel",
  //   // "Dadar",
  //   //  "Kharghar",
  //   // "Thane",
  //   // "Ratnagiri",
  //   // "Pune"
  // ];

  // static List<String> plantName = ["Tomato", "chilli"];
  // static List imageName = [
  //   "https://media.istockphoto.com/photos/tomatoes-plant-picture-id177508659",
  //   "https://5.imimg.com/data5/FL/OD/MY-31834979/green-chilli-plant-500x500.jpg"
  // ];

  // final List<Crop> data = List.generate(
  //     plantName.length,
  //     (index) => Crop(
  //         "${plantName[index]}", "${imageName[index]}", "${nursery[index]}", "{Location[index]}"));