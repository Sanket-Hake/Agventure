import 'package:flutter/material.dart';
import 'package:sanket/app_screen/utils.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Data = ModalRoute.of(context)!.settings.arguments as Crop;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: Data.Agventure.length.compareTo(0),
          itemBuilder: (BuildContext context, int index ,) {
            return 
            Container(child: Text(
              
              Data.Agventure[index]['plantName']));
          },
        ),
      ),
    );
  }
}
