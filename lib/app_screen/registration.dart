import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registration_page extends StatelessWidget {
  @override
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("user");
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final TextEditingController _textEditingController5 = TextEditingController();
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
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
                register("Name", "Enter Your Name", false, Icon(Icons.people),
                    "", _textEditingController1),
                SizedBox(
                  height: 10,
                ),
                register("Number", "Enter Your Mobile Number", false,
                    Icon(Icons.contact_page), "", _textEditingController2),
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
                    controller: _textEditingController3,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter some text";
                      }
                    },
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: "Email ID",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email_outlined),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.amber, width: 2)),
                        hintText: "Enter your Email Address",
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
                    controller: _textEditingController4,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter some text";
                      }
                    },
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password_sharp),
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
                register(
                    "Confirm Password",
                    "Confirmed Your Password",
                    true,
                    Icon(Icons.password_outlined),
                    "confirmedp",
                    _textEditingController5),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    await collectionReference.add({
                      'Name': _textEditingController1.text,
                      'MObile No': _textEditingController2.text,
                      'email': _textEditingController3.text,
                      'password': _textEditingController4.text
                    }).then((value) => _textEditingController1.clear());
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
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

Widget register(String labelText, String hintText, bool x, Icon myicon,
    String y, TextEditingController z) {
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
      controller: z,
      style: TextStyle(fontSize: 15),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please Enter some text";
        }
      },
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
