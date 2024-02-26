import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Q72(),
    );
  }
}

class _Q72 extends StatefulWidget {
  const _Q72({super.key});

  @override
  State<_Q72> createState() => __Q72State();
}

class __Q72State extends State<_Q72> {
  var alert;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Que 72"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          alert = AlertDialog(
            title: Text("Alert"),
            content: Text("press bottom for grant permession"),
            actions: [ElevatedButton(onPressed: () {}, child: Text("yes"))],
          )
        ],
      ),
    );
  }
}
