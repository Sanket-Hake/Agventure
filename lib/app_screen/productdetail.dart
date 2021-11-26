import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanket/app_screen/productdetail.dart';
import 'package:sanket/app_screen/utils.dart';

class product extends StatelessWidget {
  // final Crop crop;
  // const product({Key? key, required this.crop}) : super(key: key);
  // final plantp = [
  //   "Brinjal",
  //   "Bhindi",
  //   "Capsium",
  //   "Tomato",
  //   "Chilli",
  //   "Cucumber",
  // ];

  @override
  Widget build(BuildContext context) {
    var plant = "Data.Agventure[index]['plantName']";
    var image = "{Data.Agventure[index]['image']}";
    final Data = ModalRoute.of(context)!.settings.arguments as Crop;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Plant Data"),
      ),
      body: ListView.builder(
          itemCount: Data.Agventure.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10),
                child: new FittedBox(
                  child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(30),
                      // shadowColor: Color(0x802196F3),
                      shadowColor: Colors.green,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(Data.Agventure[index]['plantName'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 180,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(24.0),
                                child: Image(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topRight,
                                  image: NetworkImage(
                                      Data.Agventure[index]['image']),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            );
          }),
    );
  }
}
