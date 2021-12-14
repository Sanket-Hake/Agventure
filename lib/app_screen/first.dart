import 'package:flutter/material.dart';

class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: atharv());
  }
}

class atharv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Image.asset(
                'assets/images/Agventure.png',
                fit: BoxFit.cover,
              )),

              // Column(
              //   children: <Widget>[
              //     Text(
              //       "Welcome to",
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 30,
              //       ),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       "AGVENTURE",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.green,
              //         fontSize: 50,
              //       ),
              //     )
              //   ],
              // ),
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    'assets/images/welcome.png',
                    fit: BoxFit.cover,
                  )),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.pushNamed(context, "/Login_page_User");
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "BUYER",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  // creating the signup button
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.pushNamed(context, "/login_page_Owner");
                    },
                    color: Color(0xFF388E3C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "SELLER",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18), 
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
