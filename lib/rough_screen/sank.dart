import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class sank extends StatelessWidget {
  const sank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firestoreDB =
        FirebaseFirestore.instance.collection("nurseryList").snapshots();
    return Scaffold(
      appBar: AppBar(title: Text("Plant Data")),
      body: StreamBuilder(
          stream: firestoreDB,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text((snapshot.data! as QuerySnapshot).docs[index]
                      ['nursaryName']),
                       
                  );
                });
          }),
    );
  }
 }
