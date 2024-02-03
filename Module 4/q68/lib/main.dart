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
      home: ListViewContextMenuDemo(),
    );
  }
}

class ListViewContextMenuDemo extends StatefulWidget {
  @override
  _ListViewContextMenuDemoState createState() =>
      _ListViewContextMenuDemoState();
}

class _ListViewContextMenuDemoState extends State<ListViewContextMenuDemo> {
  List items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  dynamic currentIndex = 0;
  TextEditingController name = new TextEditingController();
  String? names;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q68'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                currentIndex = index;
              });
              edit();
            },
            onLongPress: () {
              setState(() {
                items.remove(item);
              });
            },
          );
        },
      ),
    );
  }

  Future edit() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Text("Edit ${items[currentIndex]}"),
                TextField(controller: name),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        items[currentIndex] = name.text.toString();
                        name.text = "";
                      });
                      Navigator.pop(context);
                    },
                    child: Text("ok"))
              ],
            ),
          );
        });
  }
}
