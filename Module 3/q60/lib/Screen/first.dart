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
      backgroundColor: Colors.grey[250],
      body: Column(
        children: [
          Container(
            child: ListTile(
              leading: Icon(Icons.arrow_back),
              trailing: Icon(Icons.search),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Restaurant",
                        textAlign: TextAlign.left,
                      ),
                      Text("25-30 min"),
                      Text("Orange Sandwiches is Delicious")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9Y7_Zs5kdzt6_Y1E9qqzxSwEtoxi7eYb2b6lTz5t0EmR3pQ8y"),
                        )),
                      ),
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
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow),
                  child: Center(child: Text("Recommended")),
                ),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(child: Text("Popular")),
                ),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(child: Text("Noodles")),
                ),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(child: Text("Pizza")),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Card(
                  child: Image(
                      image: NetworkImage(
                          "https://rasamalaysia.com/wp-content/uploads/2013/01/soba-noodle-soup-thumb.jpg")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
