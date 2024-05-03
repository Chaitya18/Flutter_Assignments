import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyStore extends StatefulWidget {
  const MyStore({super.key});

  @override
  State<MyStore> createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  List images = [];
  List items = [];
  List price = [];
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

  Future<void> getmethod() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("Products")
        .doc("$useruid")
        .collection("Products1")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((document) {
        var data = document.data();
        if (data != null) {
          setState(() {
            images.add(data["Url"]);
            items.add(data["Name"]);
            price.add(data["Price"]);
          });
        }
      });
    } else {
      print("No documents found");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upload();
    Future.delayed(Duration(seconds: 1));
    getmethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white60,
        child: Column(
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: List.generate(items.length, (index) {
                  return Container(
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 125,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            image: DecorationImage(
                              image: images[index] != ""
                                  ? NetworkImage("${images[index]}")
                                  : NetworkImage(
                                      "https://static.thenounproject.com/png/4693713-200.png"),
                              fit: BoxFit.cover, // Adjust the fit as needed
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${items[index]}",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Price: ${price[index]}",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
