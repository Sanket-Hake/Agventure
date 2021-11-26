import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registration_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    var context2 = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: ListView(
        children: [
          Container(
              child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Column(children: [
                Text('Create Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Create a new account',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                register(
                    "Name", "Enter Your Name", false, Icon(Icons.people), ""),
                SizedBox(
                  height: 10,
                ),
                register("Number", "Enter Your Mobile Number", false,
                    Icon(Icons.contact_page), ""),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    obscureText: false,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: "USERNAME",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.amber, width: 2)),
                        hintText: "Enter your username",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: false,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.amber, width: 2)),
                        hintText: "Enter your password",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                register("Confirm Password", "Confirmed Your Password", true,
                    Icon(Icons.password_outlined), "confirmedp"),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      Navigator.pushNamed(context, "/");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ]))
            ],
          ))
        ],
      ),
    );
  }
}

Widget register(
    String labelText, String hintText, bool x, Icon myicon, String y) {
  return Container(
    height: 60,
    width: 380,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      onChanged: (value) {
        String y = value;
      },
      obscureText: x,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.amber, width: 2)),
          prefixIcon: myicon,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}
