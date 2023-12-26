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
      home: MyQ54(),
    );
  }
}

class MyQ54 extends StatefulWidget {
  const MyQ54({super.key});

  @override
  State<MyQ54> createState() => _MyQ54State();
}

class _MyQ54State extends State<MyQ54> {
  double fsize = 35.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Welcome To Flutter",
            style: TextStyle(fontSize: fsize),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fsize += 5.0;
                    });
                  },
                  child: Text("+")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fsize -= 5.0;
                    });
                  },
                  child: Text("-"))
            ],
          ),
        ],
      ),
    );
  }
}
