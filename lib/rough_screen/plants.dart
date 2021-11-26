import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class plant extends StatelessWidget {
  final List<String> Plant = <String>[
    "https://images.unsplash.com/photo-1566385101042-1a0aa0c1268c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
    "https://media.istockphoto.com/photos/colorful-vegetables-and-fruits-vegan-food-in-rainbow-colors-picture-id1284690585",
    "https://www.teahub.io/photos/full/239-2398681_mix-flower-photos-hd-download..jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkBKh2mczgmRWw1YgiptdlQjaH8x1VdJkNAA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2TtvfloE6E1tF4-1q8FJOR9PH2FOEmxGBXQ&usqp=CAU",
    "https://www.bu.edu/files/2020/01/resize-iStock-802349002.jpg"
  ];
  final List<String> plantName = [
    "Vegetable Plants",
    "Fruit Plants",
    "Flowering Plant",
    "Ornamental plants",
    "Medicinal Plants",
    "Agricultural Plant"
  ];

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Plant Data"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: Plant.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/Nursery");
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 40,
                    shadowColor: Colors.green,
                    child: GridTile(
                      header: Center(
                        child: Text(
                          "${plantName[index]}",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      
                      child: Image(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage("${Plant[index]}"),
                      ),
                    )),
              );

              // ignore: unused_local_variable
            }),
      ),

      //   body: Container(
      //     padding: EdgeInsets.all(10),
      //     child: GridView(
      //         children: [
      //           Container(
      //             child: Column(children: <Widget>[
      //               Container(
      //                 child: Image(
      //                   image: AssetImage('assets/images/Sanket.jpeg'),
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               Center(
      //                 child: Text(
      //                   "forest plant",
      //                   style:
      //                       TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //                 ),
      //               )
      //             ]),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(50),
      //               color: Colors.red.shade300,
      //             ),
      //           ),
      //           Container(
      //             child: Text("Vegetable plant"),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(50),
      //               color: Colors.red.shade300,
      //             ),
      //           ),
      //           Container(
      //             child: Text("Tomato plant"),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(50),
      //               color: Colors.red.shade300,
      //             ),
      //           ),
      //           Container(
      //             child: Text("Medicinal plant"),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(50),
      //               color: Colors.red.shade300,
      //             ),
      //           ),
      //           Container(
      //             child: Text("Ornamental plant"),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(50),
      //               color: Colors.red.shade300,
      //             ),
      //           ),
      //           Container(
      //             child: Text("Fruit plant"),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(50),
      //               color: Colors.red.shade300,
      //             ),
      //           ),
      //         ],
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2, mainAxisSpacing: 50, crossAxisSpacing: 10)),
      //   ),
    );
    return scaffold;
  }
}
