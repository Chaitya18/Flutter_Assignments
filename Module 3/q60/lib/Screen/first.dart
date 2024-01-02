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
      backgroundColor: Colors.grey[400],
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
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Text("25-30 min", style: TextStyle(fontSize: 16)),
                      Text(
                        "Orange Sandwiches is Delicious",
                        style: TextStyle(fontSize: 18),
                      )
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
            height: 400,
            width: double.maxFinite,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                          height: 100,
                          width: 100, // fixed width and height
                          child: Image.asset(
                            "soba-noodle-soup-thumb-removebg-preview.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          )),
                      title: Column(
                        children: [
                          Text("Soba Soup"),
                          Text("No. 1 in Sales"),
                          Text("\$20"),
                        ],
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                          height: 100,
                          width: 100, // fixed width and height
                          child: Image.asset(
                            "soba-noodle-soup-thumb-removebg-preview.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          )),
                      title: Column(
                        children: [
                          Text("Soba Soup"),
                          Text("No. 1 in Sales"),
                          Text("\$20"),
                        ],
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                          height: 100,
                          width: 100, // fixed width and height
                          child: Image.asset(
                            "soba-noodle-soup-thumb-removebg-preview.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          )),
                      title: Column(
                        children: [
                          Text("Soba Soup"),
                          Text("No. 1 in Sales"),
                          Text("\$20"),
                        ],
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: ListTile(
              leading: Text(
                ". . . . . . . . . ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              trailing: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.shopping_bag_sharp,
                  color: Colors.black,
                ),
                backgroundColor: Colors.orange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
