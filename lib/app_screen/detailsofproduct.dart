import 'package:flutter/material.dart';
import 'package:sanket/app_screen/utils.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Data = ModalRoute.of(context)!.settings.arguments as name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: Data.Name.length.compareTo(0),
          itemBuilder: (
            BuildContext context,
            index,
          ) {
            return Container(child: Text(Data.Name[index]));
          },
        ),
      ),
    );
  }
}
