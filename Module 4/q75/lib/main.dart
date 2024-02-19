import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Q75(),
    );
  }
}

class Q75 extends StatefulWidget {
  const Q75({super.key});

  @override
  State<Q75> createState() => _Q75State();
}

class _Q75State extends State<Q75> {
  void showsnack(BuildContext context, String? msg) {
    var snackbar = SnackBar(
      content: Text(msg!),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    showsnack(context, "Good Morning Maam");
                  },
                  child: Text("Morning")),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    showsnack(context, "Good Afternoon Maam");
                  },
                  child: Text("Afternoon")),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    showsnack(context, "Good Evening Maam");
                  },
                  child: Text("Evening")),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    showsnack(context, "Good Night Maam");
                  },
                  child: Text("Night")),
            )
          ],
        ),
      ),
    );
  }
}
