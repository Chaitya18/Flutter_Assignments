import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: ListTile(
              leading: Icon(Icons.arrow_back),
              trailing: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Restaurant"),
                        Text("25-30 min"),
                        Text("Orange Sandwiches is Delicious")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "⭐4.7",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
