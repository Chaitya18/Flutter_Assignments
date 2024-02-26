import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Q78 extends StatefulWidget {
  const _Q78({super.key});

  @override
  State<_Q78> createState() => __Q78State();
}

class __Q78State extends State<_Q78> {
  TextEditingController _78textcontroller = TextEditingController();
  List l1 = [];
  bool? check = false;
  dynamic currentindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question 78"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _78textcontroller,
              decoration: InputDecoration(
                  hintText: "enter",
                  labelText: "text",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          check!
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      l1[currentindex] = _78textcontroller.text.toString();
                      check = true;
                      _78textcontroller.clear();
                    });
                  },
                  child: Text("Edit"))
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      l1.add(_78textcontroller.text.toString());
                      _78textcontroller.text = "";
                      print("$l1");
                    });
                  },
                  child: Text("add")),
          Expanded(
            child: ListView.builder(
              itemCount: l1.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          var alert = AlertDialog(
                            title: Text("Alert"),
                            content: Text("chouse any one"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      var alert1 = AlertDialog(
                                        title: Text("Alert"),
                                        content: Text(
                                            "are you sure you want to delete"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  l1.removeAt(index);
                                                });
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Yes")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("No")),
                                        ],
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (context) => alert1,
                                      );
                                    });
                                  },
                                  child: Text("delete")),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      currentindex = index;
                                      _78textcontroller.text =
                                          l1[index].toString();
                                      check = true;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Edit")),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Exit")),
                            ],
                          );
                          showDialog(
                              context: context, builder: (context) => alert);
                        });
                      },
                      child: Card(
                        elevation: 20,
                        margin: EdgeInsets.all(20),
                        child: Text("${l1[index]}"),
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
