import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExitConfirmationDemo(),
    );
  }
}

class ExitConfirmationDemo extends StatefulWidget {
  @override
  _ExitConfirmationDemoState createState() => _ExitConfirmationDemoState();
}

class _ExitConfirmationDemoState extends State<ExitConfirmationDemo> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirm Exit'),
            content: Text('Are you sure you want to exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exit Confirmation Demo'),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Center(
          child: Text('Press the back button to exit.'),
        ),
      ),
    );
  }
}
