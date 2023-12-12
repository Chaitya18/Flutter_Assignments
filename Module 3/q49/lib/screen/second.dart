import 'package:flutter/material.dart';

class Q49_2 extends StatelessWidget {
  const Q49_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 300,
            width: double.maxFinite,
            color: Colors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Oeschinen Lake Campground"),
                ),
                Text("Kandersteng,Switerzland"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.star),
                ),
                Text("41")
              ],
            ),
          ),
          Container(),
          Container()
        ],
      ),
    );
  }
}
