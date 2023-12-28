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
        title: "Color change on radio button Click Event",
        home: RadioButtonClickEvent());
  }
}

class RadioButtonClickEvent extends StatefulWidget {
  const RadioButtonClickEvent({super.key});

  @override
  State<RadioButtonClickEvent> createState() => _RadioButtonClickEventState();
}

class _RadioButtonClickEventState extends State<RadioButtonClickEvent> {
  Color cname = Colors.white;
  String? tools;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cname,
      appBar: AppBar(
        title: Text("Color Change On Radio Button Click"),
      ),
      body: Column(
        children: [
          Container(
            child: RadioListTile(
                title: Text("Red"),
                value: "Red",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    cname = Colors.red;
                  });
                }),
          ),
          Container(
            child: RadioListTile(
                title: Text("Green"),
                value: "Green",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    cname = Colors.green;
                  });
                }),
          ),
          Container(
            child: RadioListTile(
                title: Text("Blue"),
                value: "Blue",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    cname = Colors.blue;
                  });
                }),
          ),
          Container(
            child: RadioListTile(
                title: Text("Yellow"),
                value: "Yellow",
                groupValue: tools,
                onChanged: (value) {
                  setState(() {
                    cname = Colors.yellow;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
