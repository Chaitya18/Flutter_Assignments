import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Q77(),
    );
  }
}

class _Q77 extends StatefulWidget {
  const _Q77({super.key});

  @override
  State<_Q77> createState() => __Q77State();
}

class __Q77State extends State<_Q77> {
  List personlist = ["om", "ayush", "chaitya", "abhishek", "jay"];
  List contectlist = [
    1234335346,
    45645757457,
    547423545,
    574577477575,
    5745644444,
  ];

  Future<void> callApp(dynamic number) async {
    print(number);
    Uri phonecall = Uri(scheme: "tel", path: number as String);
    await launchUrl(phonecall);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Call Url"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: personlist.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              callApp(contectlist[index]);
            },
            child: Card(
              elevation: 20,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("${personlist[index]}"),
                subtitle: Text("${contectlist[index]}"),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Q77_1 extends StatefulWidget {
  const _Q77_1({super.key});

  @override
  State<_Q77_1> createState() => __Q77_1State();
}

class __Q77_1State extends State<_Q77_1> {
  TextEditingController _urlcontroller = TextEditingController();

  Future<void> myurlLauncher(String? url) async {
    Uri uri = Uri.parse(url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("url launcher"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _urlcontroller,
              decoration: InputDecoration(
                labelText: "enter url",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                myurlLauncher(_urlcontroller.text.toString());
              },
              child: Text("LAUNCH URL")),
        ],
      ),
    );
  }
}
