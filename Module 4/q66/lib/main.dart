import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Q66(),
    );
  }
}

class _Q66 extends StatefulWidget {
  const _Q66({super.key});

  @override
  // ignore: library_private_types_in_public_api
  __Q66State createState() => __Q66State();
}

class __Q66State extends State<_Q66> {
  DateTime currentdate = DateTime.now();
  String tname = "Current Date";

  void CustomDateTime(context) async {
    final DateTime? cdatetime = await showDatePicker(
      context: context,
      initialDate: currentdate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (cdatetime != null && cdatetime != currentdate) {
      setState(() {
        currentdate = cdatetime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question 66"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$tname",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "${currentdate.toLocal()}".split(" ")[0],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                CustomDateTime(context);
                setState(() {
                  tname = "Selected Date";
                });
              },
              child: Text("Select"),
            ),
          ],
        ),
      ),
    );
  }
}
