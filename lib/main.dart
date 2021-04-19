import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notey/screens/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notey/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _future = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.indigo,
          
        ),
        home: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return LoginScreen();
            }
          },
        ));
  }
}
