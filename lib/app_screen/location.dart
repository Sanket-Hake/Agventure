import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sanket/app_screen/drop_down.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/Nursery');
      //   },
      //   child: Icon(
      //     Icons.arrow_forward_outlined,
      //   ),
      // ),
      body: DropButton(),

      // body: Container(
      //     child: Column(
      //   children: [
      //     SizedBox(height: 30),
      //     Container(
      //       height: 50,
      //       width: 380,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //       child: TextFormField(
      //         obscureText: true,
      //         style: TextStyle(fontSize: 10),
      //         decoration: InputDecoration(
      //             labelText: "Enter Your Location",
      //             labelStyle: TextStyle(color: Colors.black, fontSize: 20),
      //             focusedBorder: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(50),
      //                 borderSide: BorderSide(color: Colors.red, width: 3)),
      //             prefixIcon: Icon(Icons.location_on),
      //             contentPadding: EdgeInsets.symmetric(horizontal: 20)),
      //       ),
      //     ),
      //   ],
      // )),
    );
  }
}
