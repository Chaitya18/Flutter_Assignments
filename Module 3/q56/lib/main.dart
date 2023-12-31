import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Q56',
      home: MyQ56(),
    );
  }
}

class MyQ56 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Around Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image-1.jpeg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(width: 16),
                Image.asset(
                  'assets/image-1.jpeg',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Your Text Here',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image-1.jpeg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(width: 16),
                Image.asset(
                  'assets/image-1.jpeg',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
