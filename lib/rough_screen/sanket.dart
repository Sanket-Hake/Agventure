import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
      child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/theme.jpg",
                ),
                fit: BoxFit.cover),
          ),
          padding: EdgeInsets.fromLTRB(50, 100, 0, 20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Button(),
            ],
          )),
    ));
  }
}

class FarmImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetimage = AssetImage('assets/images/farm.jpg');
    Image image = Image(
      image: assetimage,
      height: 350,
      width: 300,
    );
    return Container(
      child: image,
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.fromLTRB(0.0, 50.0, 10.0, 0.0),
          height: 100.0,
          width: 150.0,
          child: RaisedButton(
            color: Colors.white,
            child: Text(
              "Sign in",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            elevation: 10.0,
            onPressed: () {
              bookFlight(BuildContext, context);
            },
          )),
    );
  }

  void bookFlight(BuildContext, Context) {
    var alertDialog = AlertDialog(
        title: Text("Signed in completed"),
        content: Text("Now you can Buy a product"));

    showDialog(
        context: Context,
        builder: (context) {
          return alertDialog;
        });
  }
}
