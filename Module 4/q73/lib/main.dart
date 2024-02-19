// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Q73_1(),
    );
  }
}

class Q73 extends StatefulWidget {
  const Q73({super.key});

  @override
  State<Q73> createState() => _Q73State();
}

class _Q73State extends State<Q73> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 98,
            width: 250,
            color: Colors.yellow,
            child: Center(
              child: Text("Hello welcome to Q73"),
            ),
          )
        ],
      ),
    );
  }
}

class Q73_1 extends StatefulWidget {
  const Q73_1({super.key});

  @override
  State<Q73_1> createState() => _Q73_1State();
}

class _Q73_1State extends State<Q73_1> {
  @override
  void initState() {
    super.initState();
    splashscreen();
  }

  Future<void> splashscreen() async {
    await Future.delayed(Duration(seconds: 5), () {
      FlutterSplashScreen.hide();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Q73(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          height: 300,
          width: 400,
          color: Colors.teal,
          child: Center(
            child: Text("Welcome To Splash Screen Example"),
          ),
        ),
      ),
    );
  }
}
