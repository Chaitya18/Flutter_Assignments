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
      home: _Q67(),
    );
  }
}

class _Q67 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options Menu Example'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'profile') {
                print('Profile selected');
              } else if (value == 'logout') {
                print('Logout selected');
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'profile',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
