import 'package:flutter/material.dart';

class password_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Container(
        height: 1000,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/sunny-meadow-landscape.jpg",
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
