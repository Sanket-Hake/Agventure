
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:sanket/app_screen/listview.dart';

// class Second_Page extends StatefulWidget {
  

//   @override
//   _Second_PageState createState() => _Second_PageState();
// }

// class _Second_PageState extends State<Second_Page> {
//   @override
//   var district = [
//       'Ahmednagar',
//       'Akola',
//       'Amravati',
//       'Aurangabad',
//       'Bhandara',
//       'Beed',
//       'Buldhana',
//       'Chandrapur',
//       'Dhule',
//       'Gadchiroli',
//       'Gondia',
//       'Hingoli',
//       'Jalgaon',
//       'Jalna',
//       'Kolhapur',
//       'Latur',
//       'Mumbai City',
//       'Mumbai suburban',
//       'Nandurbar',
//       'Nanded',
//       'Nagpur',
//       'Nashik',
//       'Osmanabad',
//       'Parbhani',
//       'Pune',
//       'Raigad',
//       'Ratnagiri',
//       'Sindhudurg',
//       'Sangli',
//       'Solapur',
//       'Satara',
//       'Thane',
//       'Wardha',
//       'Washim',
//       'Yavatmal',
//     ];
//     var currentvalueselected = "Raigad";

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Enter Your Location"),
//         ),
//         body: ListView(
//           children: <Widget>[
//             ListTile(
//               title: Text("Enter your District ",
//               style: TextStyle(
//                 color: Colors.purpleAccent
//               ),),
//               trailing:Container(
//                 child:DropdownButton<String>(
//                 dropdownColor: Colors.white ,
//                 style: TextStyle(
//                 color :  Colors.pink ,
                
//                 ),
//                 elevation: 20,
//                 items: district.map((String dropDownStringItem) {
//                   return DropdownMenuItem<String>(
//                     value: dropDownStringItem,
//                     child: Text(dropDownStringItem), 
//                   );
//                 }).toList(),
//                 onChanged: (newValueSelected) {
//                   setState(() {
//                     this.currentvalueselected = newValueSelected!;
//                   });
//                 },
//                 value: currentvalueselected,
//               ), 
//               ) 
//             )
//           ],
//         ));

//   }
// }

  