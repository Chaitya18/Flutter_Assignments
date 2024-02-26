import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const _Q76(),
    );
  }
}

class _Q76 extends StatefulWidget {
  const _Q76({super.key});

  @override
  State<_Q76> createState() => __Q76State();
}

class __Q76State extends State<_Q76> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  int? n1;
  int? n2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: c1,
          ),
          TextField(
            controller: c2,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  n1 = int.parse(c1.text.toString());
                  n2 = int.parse(c2.text.toString());
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _Q72_2(
                        number1: n1,
                        number2: n2,
                      ),
                    ));
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}

class _Q72_2 extends StatelessWidget {
  _Q72_2({super.key, this.number1, this.number2});
  int? number1;
  int? number2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("${number1! + number2!}"),
    );
  }
}
