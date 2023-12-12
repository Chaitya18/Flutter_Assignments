import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Q53(),
    );
  }
}

class Q53 extends StatefulWidget {
  const Q53({super.key});

  @override
  State<Q53> createState() => _Q53State();
}

class _Q53State extends State<Q53> {
  Color cname = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cname,
      appBar: AppBar(
        title: Text("Color Change On Button Click"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  cname = Colors.blue;
                });
              },
              child: Text("Blue"))
        ],
      ),
    );
  }
}
