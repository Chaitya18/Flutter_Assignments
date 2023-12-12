import 'package:flutter/material.dart';
import 'package:q47/screen/first.dart';
import 'package:q47/screen/second.dart';

void main() {
  runApp(MyAssignmentQ47());
}

class MyAssignmentQ47 extends StatelessWidget {
  const MyAssignmentQ47({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Q49_1(),
    );
  }
}
