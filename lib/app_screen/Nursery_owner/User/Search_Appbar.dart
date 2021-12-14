import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sanket/app_screen/Nursery_owner/User/drawer.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Nursry_Home.dart';
import 'package:sanket/rough_screen/listview_Nursery.dart';


class DataSearch extends SearchDelegate<String> {
  @override
  final nursery = ["Fruit", "Vegetable", "Ornamental", "Forest", "Agriculture"];
  final recentnursery = ["Fruit", "Vegetable", "Ornamental"];

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
