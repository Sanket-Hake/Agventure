import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sanket/app_screen/drawer.dart';
import 'package:sanket/rough_screen/sanket.dart';
import 'package:sanket/app_screen/listview_Nursery.dart';
import 'package:sanket/app_screen/drop_down.dart';

class nursery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        elevation: 20,
        title: Text(
          "AGVENTURE",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: getListview(),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  final nursery = [
    "Tanuja hightech nursery Uran ",
    "Sahyadri Farma nursery Panvel ",
    "Abhishek hightech nursery Dadar ",
    "Tanuja Nursery Kharghar",
    "Green Valley Nursery Thane",
    "Shradha nurserey Ratnagiri"
  ];
  final recentnursery = [
    "Tanuja Nursery",
    "Green Valley Nursery",
    "Shradha nurserey"
  ];

  List<Widget>? buildActions(BuildContext context) {
   
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        Navigator.pushNamed(context, '/Nursery');
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final List<String> suggestionList = query.isEmpty
        ? recentnursery
        : nursery.where((p) => p.startsWith(query)).toList();
    return InkWell(
      child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.location_city),
                title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ]),
                ),
                onTap: () {},
              ),
          itemCount: suggestionList.length),
    );

    throw UnimplementedError();
  }
}
