// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_element

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
      home: _Q64(),
    );
  }
}

class _Q64 extends StatefulWidget {
  const _Q64({super.key});

  @override
  State<_Q64> createState() => __Q64State();
}

class __Q64State extends State<_Q64> {
  String? name;
  String? result;
  String? rname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  dchoice(context);
                },
                child: Text("Press")),
            Text("$result"),
            RadioListTile(
                title: Text("Ahmedabad"),
                value: "Ahmedabad",
                groupValue: rname,
                onChanged: (value) {
                  setState(() {
                    rname = value;
                  });
                }),
            RadioListTile(
                title: Text("Surat"),
                value: "Surat",
                groupValue: rname,
                onChanged: (value) {
                  setState(() {
                    rname = value;
                  });
                }),
            RadioListTile(
                title: Text("Vadodra"),
                value: "Vadodra",
                groupValue: rname,
                onChanged: (value) {
                  setState(() {
                    rname = value;
                  });
                }),
          ],
        ),
      ),
    );
  }

  void dchoice(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              children: [
                RadioListTile(
                    title: Text("Ahmedabad"),
                    value: 'Ahmedabad',
                    groupValue: rname,
                    onChanged: (value) {
                      setState(() {
                        rname = value;
                      });
                    }),
                RadioListTile(
                    title: Text("Surat"),
                    value: "Surat",
                    groupValue: rname,
                    onChanged: (value) {
                      setState(() {
                        rname = value;
                      });
                    }),
                RadioListTile(
                    title: Text("Vadodra"),
                    value: "Vadodra",
                    groupValue: rname,
                    onChanged: (value) {
                      setState(() {
                        rname = value;
                      });
                    }),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    result = rname;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}
