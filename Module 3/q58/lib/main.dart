import 'package:flutter/material.dart';

/// Flutter code sample for [Slider].

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MYQ58(),
    );
  }
}

class MYQ58 extends StatefulWidget {
  const MYQ58({super.key});

  @override
  State<MYQ58> createState() => _MYQ58State();
}

class _MYQ58State extends State<MYQ58> {
  double currentslidervalue = 0;
  Color cname = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cname,
      appBar: AppBar(title: Text('Slider Color Change')),
      body: Slider(
        value: currentslidervalue,
        max: 100,
        divisions: 5,
        label: currentslidervalue.round().toString(),
        onChanged: (double value) {
          setState(() {
            currentslidervalue = value;
            if (currentslidervalue == 20) {
              cname = Colors.red;
            } else if (currentslidervalue == 40) {
              cname = Colors.green;
            } else if (currentslidervalue == 60) {
              cname = Colors.blue;
            } else if (currentslidervalue == 80) {
              cname = Colors.purple;
            } else if (currentslidervalue == 100) {
              cname = Colors.yellow;
            } else {
              cname = Colors.teal;
            }
          });
        },
      ),
    );
  }
}
