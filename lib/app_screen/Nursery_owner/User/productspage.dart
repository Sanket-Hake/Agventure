import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sanket/app_screen/Nursery_owner/User/plants_detail.dart';
import 'package:sanket/model/category.dart';

class productpage extends StatelessWidget {
  String Title;
  String Namenursery;
  productpage({Key? key, required this.Title, required this.Namenursery})
      : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 30,
        title: Center(child: Text(Title)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: StreamBuilder(
        stream: db
            .collection('Product')
            .where("Category", isEqualTo: Title)
            .where("NurseryName", isEqualTo: Namenursery)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final Value = (snapshot.data! as QuerySnapshot).docs;
          return FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Value.length > 0
                  ? ListView.builder(
                      itemCount: Value.length,
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
                                shadowColor: Colors.green,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailPage(
                                                name: Value[index]
                                                    ["ProductName"],
                                                img: Value[index]
                                                    ["ProductImage"],
                                                price: Value[index]
                                                    ["productprice"],
                                                Des: Value[index]
                                                    ["discription"],
                                              )),
                                    );
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                              Value[index]['ProductName'],
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      SizedBox(width: 70),
                                      Container(
                                        width: 300,
                                        height: 180,
                                        child: ClipRRect(
                                          borderRadius:
                                              new BorderRadius.circular(24.0),
                                          child: Image(
                                            fit: BoxFit.contain,
                                            alignment: Alignment.topRight,
                                            image: NetworkImage(
                                                Value[index]["ProductImage"]),
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
                      })
                  : Center(
                      child: Text(
                        "No Data Available",
                        style: TextStyle(fontSize: 25, color: Colors.green),
                      ),
                    ));
        },
      ),
    );
  }
}
