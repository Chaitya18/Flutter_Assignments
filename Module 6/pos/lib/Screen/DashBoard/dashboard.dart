// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos/Screen/Invoice-Generator/Billing.dart';
import 'package:pos/Screen/Products-Section/MyStore.dart';
import 'package:pos/Screen/Products-Section/new-upload.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class MyDashboard extends StatefulWidget {
  User? user1;
  MyDashboard({super.key, this.user1});
  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  List images = [
    "my_store.png",
    "new_product.png",
    "bill_generator.png",
    "sales_analysis.png",
    "history.png",
    "Aboutus.png"
  ];
  List status = [
    "My Store",
    "New Product",
    "Generate Bill",
    "Sales Analysis",
    "History",
    "About-us"
  ];
  List pages = [
    MyStore(),
    MyUploadPage(),
    MyBillgenerator(),
    MyStore(),
    MyUploadPage(),
    MyBillgenerator(),
  ];
  int sales = 0;
  String todaysdate = "";
  String? username;
  bool refresh = false;
  int todaysale = 0;
  int todayonlinesales = 0;
  int todayofflinesales = 0;
  int todaycardsales = 0;
  DateTime today = DateTime.now();
  Future<void> FetchUser() async {
    var document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.user1!.uid)
        .get();

    if (document.exists) {
      var data = document.data();
      if (data != null && data.containsKey("name")) {
        setState(() {
          username = data["name"];
        });
      }
    }
  }

  Future<void> getData() async {
    setState(() {
      todaysale = 0;
    });

    var onlineSnapshot = await FirebaseFirestore.instance
        .collection("Receipt")
        .doc(widget.user1!.uid)
        .collection("${today.day}-${today.month}-${today.year}")
        .where("Mode of Payment",
            isEqualTo: "Online") // Filter by online payments
        .get();

    var offlineSnapshot = await FirebaseFirestore.instance
        .collection("Receipt")
        .doc(widget.user1!.uid)
        .collection("${today.day}-${today.month}-${today.year}")
        .where("Mode of Payment",
            isEqualTo: "Cash") // Filter by offline payments
        .get();
    var cardSnapshot = await FirebaseFirestore.instance
        .collection("Receipt")
        .doc(widget.user1!.uid)
        .collection("${today.day}-${today.month}-${today.year}")
        .where("Mode of Payment",
            isEqualTo: "Card") // Filter by offline payments
        .get();

    int onlineAmount = 0;
    int offlineAmount = 0;
    int cardAmount = 0;

    if (onlineSnapshot.docs.isNotEmpty) {
      onlineSnapshot.docs.forEach((document) {
        var data = document.data();
        if (data != null) {
          int currentAmount = data["Total"];
          onlineAmount += currentAmount;
        }
      });
    }

    if (offlineSnapshot.docs.isNotEmpty) {
      offlineSnapshot.docs.forEach((document) {
        var data = document.data();
        if (data != null) {
          int currentAmount = data["Total"];
          offlineAmount += currentAmount;
        }
      });
    }
    if (cardSnapshot.docs.isNotEmpty) {
      cardSnapshot.docs.forEach((document) {
        var data = document.data();
        if (data != null) {
          int currentAmount = data["Total"];
          cardAmount += currentAmount;
        }
      });
    }
    // Update the todaysale variable based on online and offline amounts
    setState(() {
      todaysale = onlineAmount + offlineAmount;
      todayofflinesales = offlineAmount;
      todayonlinesales = onlineAmount;
      todaycardsales = cardAmount;
    });
  }

  Future<void> _handleRefresh() async {
    setState(() {
      todaysale = 0;
    });
    Timer(Duration(seconds: 1), () {
      setState(() {
        refresh = false;
      });
    });
    getData();
    fetchsales();
    initializePrinter();
  }

  Future<void> fetchsales() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("Receipt")
        .doc(widget.user1!.uid)
        .collection(todaysdate)
        .get();

    int maxId = 0; // Initialize maxId variable to store the maximum ID found
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((document) {
        var data = document.data();
        if (data != null) {
          int currentId = data["Receipt id"];
          if (currentId > maxId) {
            maxId = currentId;
          }
        }
      });
    }
    sales = maxId;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchUser();
    getData();
    setState(() {
      todaysdate = "${today.day}-${today.month}-${today.year}";
    });
    fetchsales();
    Future.delayed(Duration(seconds: 5));
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initializePrinter();
    });
  }

  Future<void> initializePrinter() async {
    try {
      await PrintBluetoothThermal.connect(
          macPrinterAddress: "DC:0D:30:63:DD:1D");
    } catch (e) {
      print('Error initializing printer: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height * 45) / 100,
                  decoration: BoxDecoration(
                    color: Colors.indigo[900],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 25,
                        ),
                        trailing: GestureDetector(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/images/person.png",
                                  fit: BoxFit.cover)),
                        ),
                        onTap: () {
                          initializePrinter();
                          _handleRefresh();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 90,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Sale",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text("Rs. $todaysale",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 90,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Invoices",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text("$sales",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 90,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Online",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text("Rs. $todayonlinesales",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cash",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text("Rs. $todayofflinesales",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Card",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text("Rs. $todaycardsales",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 290,
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height * 60) / 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: Container(
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              children: List.generate(images.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 125,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/${images[index]}"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Text(
                                            "${status[index]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 23,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'RobotoMono'),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => pages[index],
                                          ));
                                    },
                                  ),
                                );
                              }),
                            ),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        onRefresh: () {
          return _handleRefresh();
        },
      ),
    );
  }
}
