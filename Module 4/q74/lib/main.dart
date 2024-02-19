import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Q74(),
    );
  }
}

class Q74 extends StatefulWidget {
  const Q74({super.key});

  @override
  State<Q74> createState() => _Q74State();
}

class _Q74State extends State<Q74> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Q74_1(),
              ));
        },
        child: Text("Next Screen"),
      ),
    );
  }
}

class Q74_1 extends StatefulWidget {
  const Q74_1({super.key});

  @override
  State<Q74_1> createState() => _Q74_1State();
}

class _Q74_1State extends State<Q74_1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        color: Colors.teal,
        child: Center(
          child: Text(
            "This is Second Screen",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
