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
      home: _Q69(),
    );
  }
}

class _Q69 extends StatefulWidget {
  const _Q69({super.key});

  @override
  State<_Q69> createState() => __Q69State();
}

class __Q69State extends State<_Q69> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.pan_tool),
      ),
      appBar: AppBar(
        title: Text("Question 69"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                color: Colors.blue,
                child: Scaffold(
                  drawer: Drawer(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        TabBar(
                          tabs: [
                            Tab(
                              child: Text("Gmail"),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  body: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            decoration:
                                InputDecoration(hintText: "Search your mail"),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        child: Icon(Icons.person),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 410),
                  child: Text("Primary"),
                ),
              ),
              Container(
                height: 580,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                    ListTile(
                      title: Text("Flutter Assignment"),
                      leading: Icon(Icons.message),
                      trailing: Icon(Icons.menu),
                    ),
                  ],
                ),
              ),
              BottomNavigationBar(items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: "messages"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.camera), label: "camera"),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
