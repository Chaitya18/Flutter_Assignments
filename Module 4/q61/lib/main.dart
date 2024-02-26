// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:q61/Screen/1.dart';
import 'package:q61/Screen/2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen2(),
    );
  }
}
