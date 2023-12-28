import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Checkbox Show Textbox when clicked',
      home: MyCheckBoxScrween(),
    );
  }
}

class MyCheckBoxScrween extends StatefulWidget {
  @override
  _MyCheckBoxScrweenState createState() => _MyCheckBoxScrweenState();
}

class _MyCheckBoxScrweenState extends State<MyCheckBoxScrween> {
  bool a = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox OnPress TextBox Show'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Checkbox(
                  value: a,
                  onChanged: (value) {
                    setState(() {
                      a = value ?? false;
                    });
                  },
                ),
                Text('Show TextView'),
              ],
            ),
            Visibility(
              visible: a,
              child: Text(
                'This is the Textview Part',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
