import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanket/app_screen/Search_Appbar.dart';
import 'package:sanket/app_screen/plants_detail.dart';
import 'package:animate_do/animate_do.dart';

import '../model/category.dart';

class Nursery1 extends StatelessWidget {
  int item_count;
  var x;
  Nursery1({Key? key, required this.item_count, this.x}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInDown(
        delay: Duration(milliseconds: 800),
        child: ListView.builder(
          itemCount: item_count,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                    name: x[index]["plantName"],
                                    img: x[index]["image"][index],
                                    price: x[index]["price"],
                                    MulImage: x[index]["Mulimage"],
                                    Des: x[index]["Des"],
                                  )),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(x[index]["plantName"],
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
                                image: NetworkImage(x[index]["image"]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
