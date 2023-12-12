import 'package:flutter/material.dart';

class MyFirstScreen extends StatefulWidget {
  const MyFirstScreen({super.key});

  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  TextEditingController fnum = TextEditingController(); //First Number
  TextEditingController snum = TextEditingController(); //Second Number
  String? num1;
  String? num2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Numbers Coming Between Two Numbers"),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: fnum,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
