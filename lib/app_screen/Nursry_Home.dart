import 'package:flutter/material.dart';
import 'package:sanket/app_screen/Search_Appbar.dart';
import 'package:sanket/app_screen/drawer.dart';
import 'package:sanket/app_screen/ListView_N.dart';
import 'package:sanket/model/category.dart';

class home_Nursery extends StatefulWidget {
  const home_Nursery({Key? key}) : super(key: key);

  @override
  _home_NurseryState createState() => _home_NurseryState();
}

class _home_NurseryState extends State<home_Nursery>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  var index;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Nurseries",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(isScrollable: true, controller: _controller, tabs: [
            Tab(text: "Blossom Valley "),
            Tab(text: "EverGreen "),
            Tab(text: "Harmony Garden"),
            Tab(text: "Paradise Nursery"),
            Tab(text: "Garden Gate")
          ]),
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
        body: TabBarView(controller: _controller, children: <Widget>[
          Nursery1(
            item_count: BlossomValley.length,
            x: BlossomValley,
          ),
          Nursery1(
            item_count: BlossomValley.length,
            x: BlossomValley,
          ),
          Nursery1(
            item_count: BlossomValley.length,
            x: BlossomValley,
          ),
          Nursery1(
            item_count: BlossomValley.length,
            x: BlossomValley,
          ),
          Nursery1(
            item_count: BlossomValley.length,
            x: BlossomValley,
          ),
        ]));
  }
}
