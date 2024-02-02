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
      home: _Q63(),
    );
  }
}

class _Q63 extends StatefulWidget {
  const _Q63({super.key});

  @override
  State<_Q63> createState() => __Q63State();
}

class __Q63State extends State<_Q63> {
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              mychoice(context);
            },
            child: Text("Click Me!")),
        SizedBox(height: 50),
        Text("$result"),
        SizedBox(height: 50),
      ]),
    );
  }

  void mychoice(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "Choosen : Positive";
                    });
                  },
                  child: Icon(Icons.add)),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "Choosen : Negative";
                    });
                  },
                  child: Icon(Icons.remove)),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "Choosen : Neutral";
                    });
                  },
                  child: Text("Neutral")),
              SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
