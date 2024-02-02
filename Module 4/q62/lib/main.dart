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
      home: _Q62(),
    );
  }
}

class _Q62 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Q62")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About Account Balance Function'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Text(
                  "Account Balance",
                  style: TextStyle(fontSize: 26),
                ),
                trailing: Icon(
                  Icons.account_balance,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                  "Your account balance is made up of all posted credit and debit transactions.\n It's the amount you have in the account before any pending charges are added.\n Your available balance is the amount you can use for purchases or withdrawals."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
