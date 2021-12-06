import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanket/app_screen/Reset.dart';
import 'package:sanket/app_screen/login.dart';
import 'package:sanket/app_screen/Nursry_Home.dart';
import 'package:sanket/app_screen/plantList.dart';
import 'package:sanket/app_screen/productdetail.dart';
import 'package:sanket/rough_screen/plants.dart';
import 'package:sanket/app_screen/registration.dart';
import 'package:sanket/app_screen/Search_Appbar.dart';
import 'package:sanket/app_screen/Location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'app_screen/detailsofproduct.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
            home: AnimatedSplashScreen(
                duration: 3000,
                splash: Container(
                   decoration: BoxDecoration(
                     color: Colors.lightGreenAccent
                   ),
                  height : 1000 ,
                  width: 1000,
                  child: Image.asset('assets/images/agventurelogo.png' ,fit: BoxFit.scaleDown, )
                  ),
                nextScreen: login_page(),
                splashTransition: SplashTransition.rotationTransition ,
                backgroundColor: Colors.lightGreenAccent),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              // '/': (context) => login_page() ,
              '/Nursery': (context) => home_Nursery(),
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
