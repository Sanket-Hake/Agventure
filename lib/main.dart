import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanket/app_screen/Reset.dart';
import 'package:sanket/app_screen/login.dart';
import 'package:sanket/app_screen/plantList.dart';

import 'package:sanket/app_screen/productdetail.dart';
import 'package:sanket/rough_screen/sank.dart';
import 'package:sanket/rough_screen/plants.dart';
import 'package:sanket/rough_screen/sanket.dart';
import 'package:sanket/app_screen/registration.dart';
import 'package:sanket/app_screen/password.dart';
import 'package:sanket/app_screen/Nursery_Searchbar.dart';
import 'package:sanket/app_screen/Location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'app_screen/detailsofproduct.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => login_page(),
              '/Nursery': (context) => nursery(),
              '/sanket': (context) => Home(),
              '/register': (context) => registration_page(),
              '/password': (context) => ResetP(),
              '/location': (context) => Location(),
              '/plant': (context) => HomePage(),
              '/xyz': (context) => product(),
              '/detail': (context) => Detail()
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
