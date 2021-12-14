import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Productmodel {
  late String nurseryName;
  late String category;
  late String productName;
  late int productPrice;
  late String discrption;
  late bool isOnSale;
  Productmodel(
      {required this.nurseryName,
      required this.category,
      required this.productName,
      required this.productPrice,
      required this.discrption});
  CollectionReference db = FirebaseFirestore.instance.collection("products");

  Future<void> addProduct(Productmodel Productmodel) async {
    Map<dynamic, dynamic> data = {
      "nurseryName": Productmodel.nurseryName,
      "category": Productmodel.category,
      "productName": Productmodel.productName,
      "productPrice": Productmodel.productPrice,
      "discrption": Productmodel.discrption,
      "isOnSale": Productmodel.isOnSale
    };
    await db.add("data");
  }

  Future<void> updateProduct(String Id, Productmodel UpdateProduct) async {
    Map<String, dynamic> data = {
      "nurseryName": UpdateProduct.nurseryName,
      "category": UpdateProduct.category,
      "productName": UpdateProduct.productName,
      "productPrice": UpdateProduct.productPrice,
      "discrption": UpdateProduct.discrption,
      "isOnSale": UpdateProduct.isOnSale
    };
    await db.doc(Id).update(data);
  }

  Future<void> delet(String Id) async {
    await db.doc(Id).delete() ;
  }
}
