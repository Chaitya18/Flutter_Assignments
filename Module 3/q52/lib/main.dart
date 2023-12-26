import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyQ52());
  }
}

class MyQ52 extends StatefulWidget {
  const MyQ52({super.key});

  @override
  State<MyQ52> createState() => _MyQ52State();
}

class _MyQ52State extends State<MyQ52> {
  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  double? result = 0;
  String? tools;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button Calculator"),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: num1,
              decoration: InputDecoration(labelText: "Enter Number 1"),
            ),
          ),
          Container(
            child: TextField(
              controller: num2,
              decoration: InputDecoration(labelText: "Enter Number 2"),
            ),
          ),
          Container(
            child: RadioListTile(
                title: Text("+"),
                value: "+",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    result = double.parse(num1.text) + double.parse(num2.text);
                  });
                }),
          ),
          Container(
            child: RadioListTile(
                title: Text("-"),
                value: "-",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    result = double.parse(num1.text) - double.parse(num2.text);
                  });
                }),
          ),
          Container(
            child: RadioListTile(
                title: Text("*"),
                value: "*",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    result = double.parse(num1.text) * double.parse(num2.text);
                  });
                }),
          ),
          Container(
            child: RadioListTile(
                title: Text("/"),
                value: "/",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    result = double.parse(num1.text) / double.parse(num2.text);
                  });
                }),
          ),
          Container(
            child: Text(
              "Result : $result",
              style: TextStyle(fontSize: 26),
            ),
          )
        ],
      ),
    );
  }
}
