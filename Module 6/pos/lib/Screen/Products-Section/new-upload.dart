import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pos/Screen/DashBoard/login-page.dart';
import 'package:pos/Screen/Products-Section/MyStore.dart';

class MyUploadPage extends StatefulWidget {
  const MyUploadPage({super.key});

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  TextEditingController url = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  String? useruid;
  Future<void> upload() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        useruid = user.uid;
        print("$useruid");
      });
    } else {
      print("No User");
    }
  }

  Future<void> uploaddata() async {
    await FirebaseFirestore.instance
        .collection("Products")
        .doc("$useruid")
        .collection("Products1")
        .doc()
        .set({
      "Url": url.text.toString(),
      "Name": name.text.toString(),
      "Price": price.text.toString()
    });
    print("Done");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: url,
          ),
          TextField(
            controller: name,
          ),
          TextField(
            controller: price,
          ),
          Text("$useruid"),
          ElevatedButton(onPressed: uploaddata, child: Text("Done"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyStore(),
              ));
        },
        child: Text("Show"),
      ),
    );
  }
}
