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
      home: MyQ51(),
    );
  }
}

class MyQ51 extends StatefulWidget {
  const MyQ51({super.key});

  @override
  State<MyQ51> createState() => _MyQ51State();
}

class _MyQ51State extends State<MyQ51> {
  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  int i = 0;
  int j = 0;
  List res = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Print Numbers Coming Between 2 numbers"),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: num1,
              decoration: InputDecoration(labelText: "Enetr Number 1"),
            ),
          ),
          Container(
            child: TextField(
              controller: num2,
              decoration: InputDecoration(labelText: "Enetr Number 2"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  for (i = int.parse(num1.text) + 1;
                      i <= (j = int.parse(num2.text));
                      i++) {
                    res.add(i);
                  }
                });
                Navigator.push(context, MaterialPageRoute(
                          builder: (context) => My2ndPage(
                                res: res,
                              )))
              },
              child: Text("Show")),
        ],
      ),
    );
  }
}


class My2ndPage extends StatefulWidget {
  const My2ndPage({super.key});

  @override
  State<My2ndPage> createState() => _My2ndPageState();
}

class _My2ndPageState extends State<My2ndPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}