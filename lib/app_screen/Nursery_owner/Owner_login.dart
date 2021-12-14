import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

class login_page_Owner extends StatefulWidget {
  login_page_Owner({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page_Owner> {
  @override
  String email = "";
  String password = "";
  String name = " ";
  bool changeButton = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: FadeInDownBig(
            delay: Duration(milliseconds: 600),
            child: Container(
              padding: EdgeInsets.all(4),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  // InkWell(
                  //   child: Text(
                  //     "   Welcome to ",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //        fontFamily: "Pacifico",
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 40,
                  //         color: Colors.black),
                  //   ),
                  // ),

                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Lottie.network(
                            "https://assets9.lottiefiles.com/private_files/lf30_fw6h59eu.json"),
                        // child: Image(
                        //   image: NetworkImage(
                        //       "https://myiacs.com/images/admin.jpg"),
                        //   fit: BoxFit.cover,
                        // )
                      )
                    ],
                  ),

                  Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.green, width: 3),
                          ),
                          prefixIcon: Icon(Icons.people),
                          hintText: "Enter Your Username",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 3)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter Your Password",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/password');
                    },
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  InkWell(
                    onTap: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        setState(() async {
                          logincomplete(BuildContext, context);
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, '/Nursery_Regestration');
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          NoUser(BuildContext, context);
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          WrongPassword(BuildContext, context);
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      // child: changeButton
                      //     ? Icon(
                      //         Icons.done,
                      //         color: Colors.white,
                      //       )
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  Text("OR", textAlign: TextAlign.center),

                  Container(
                    height: 100,
                    child: InkWell(
                      onTap: () {
                        signInWithGoogle(context: context).then((value) =>
                            Navigator.pushNamed(context, "/location"));
                      },
                      child: Image(
                          image: NetworkImage(
                              "https://raw.githubusercontent.com/shobhitpuri/custom-google-signin-button/master/images/GoogleSignInLight.png"),
                          fit: BoxFit.fill),
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: Row(
                      children: [
                        Text(
                          "Don't have account? ",
                          textAlign: TextAlign.right,
                        ),
                        InkWell(
                          child: Text(
                            "Register Now",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                        )
                      ],
                    ),
                  ),
                  //
                  SizedBox(
                    height: 15,
                  ),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Nursery_Regestration');
                        },
                        icon: Icon(
                          Icons.skip_next_sharp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Next',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

void logincomplete(BuildContext, Context) {
  var alertDialog = AlertDialog(
      title: Text("Signed in completed"),
      content: Text("Now you can Add or Register your nursery"));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void NoUser(BuildContext, Context) {
  var alertDialog = AlertDialog(
      title: Text(
        "Please SignUp",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text("No Accout of this Email ID"));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void WrongPassword(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: AlertDialog(
        title: Text(
          'Entered Wrong Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          "Please Correct It",
          textAlign: TextAlign.center,
        ),
      ));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

Future<User?> signInWithGoogle({required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // handle the error here
      } else if (e.code == 'invalid-credential') {
        // handle the error here
      }
    } catch (e) {
      // handle the error here
    }
  }

  return user;
}
