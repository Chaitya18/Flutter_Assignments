import 'package:flutter/material.dart';
import 'package:q60/Screen/Second.dart';
import 'package:q60/Screen/first.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: My2ndScreen(),
    );
  }
}
