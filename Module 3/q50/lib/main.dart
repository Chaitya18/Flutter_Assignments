import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reverse Number App',
      home: ReverseNumberScreen(),
    );
  }
}

class ReverseNumberScreen extends StatefulWidget {
  @override
  _ReverseNumberScreenState createState() => _ReverseNumberScreenState();
}

class _ReverseNumberScreenState extends State<ReverseNumberScreen> {
  TextEditingController num = TextEditingController();
  String rnum = '';

  void reverseNumber() {
    String inputNumber = num.text;
    int i = int.tryParse(inputNumber) ?? 0;

    int reversed = 0;
    while (i != 0) {
      int digit = i % 10;
      reversed = reversed * 10 + digit;
      i = i ~/ 10;
    }

    setState(() {
      rnum = reversed.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TextField(
                controller: num,
                decoration: InputDecoration(labelText: 'Enter a Number'),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: reverseNumber,
                child: Text('Reverse Number'),
              ),
            ),
            Container(
              child: Text(
                'Reversed Number:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                rnum,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
