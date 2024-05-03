// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos/Screen/Invoice-Generator/a.dart';
import 'package:pos/Screen/Invoice-Generator/cart.dart';

class MyBillgenerator extends StatefulWidget {
  const MyBillgenerator({super.key});

  @override
  State<MyBillgenerator> createState() => _MyBillgeneratorState();
}

class _MyBillgeneratorState extends State<MyBillgenerator> {
  TextEditingController foodsearch = TextEditingController();

  //Billing Lists
  List<String> billingitems = [];
  List<int> billingquantity = [];
  List<dynamic> billingprice = [];

  //Fetched Lists
  List images = [];
  List items = [];
  List price = [];

  //Integers
  int currentIndex = 0;

  //Strings
  String? useruid;
  String _searchText = '';

  //Bools
  bool nodata = false;
  bool fsearch = false;

  //kot
  List kotitems = [];
  List kotquantity = [];

  Future<void> userfetch() async {
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
    images.clear();
    price.clear();
    items.clear();
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
      setState(() {
        nodata = true;
      });
    }
  }

  Future<void> clear() async {
    kotitems.clear();
    kotquantity.clear();
    billingitems.clear();
    billingquantity.clear();
    billingprice.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userfetch();
    getmethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          controller: foodsearch,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            hintText: "Search",
            hintStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),
            suffixIcon:
                fsearch == false ? Icon(Icons.search) : Icon(Icons.cancel),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
          ),
          onChanged: (value) {
            setState(() {
              if (_searchText.length > 1) {
                fsearch = true;
              }
              _searchText = value.toLowerCase();
            });
          },
          onTap: () {
            setState(() {
              if (fsearch == true) {
                foodsearch.clear();
                fsearch = false;
              }
            });
          },
        ),
        actions: [],
      ),
      body: RefreshIndicator(
        child: Container(
            color: const Color.fromARGB(26, 56, 55, 55),
            child: nodata == false
                ? Column(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(10),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          children: List.generate(items.length, (index) {
                            final itemName = items[index].toLowerCase();
                            if (foodsearch.text.toString() == "" ||
                                itemName.contains(_searchText)) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: GestureDetector(
                                  child: Container(
                                    width: 145,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 125,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: images[index] != ""
                                                  ? NetworkImage(
                                                      "${images[index]}")
                                                  : NetworkImage(
                                                      "https://static.thenounproject.com/png/4693713-200.png"),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("${items[index]}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                              "${price[index]}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      String itemToFind = items[index];
                                      if (billingitems.contains(itemToFind) ||
                                          kotitems.contains(itemToFind)) {
                                        currentIndex =
                                            billingitems.indexOf(itemToFind);

                                        kotquantity[currentIndex] =
                                            kotquantity[currentIndex] + 1;
                                        billingquantity[currentIndex] =
                                            billingquantity[currentIndex] + 1;
                                        Fluttertoast.showToast(msg: "Added");
                                      } else {
                                        billingitems.add(itemToFind);
                                        billingquantity.add(1);
                                        billingprice.add(price[index]);
                                        kotitems.add(itemToFind);
                                        kotquantity.add(1);
                                        Fluttertoast.showToast(msg: "Added");
                                      }
                                    });
                                  },
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        ),
                      )),
                      BottomAppBar(
                        shape: CircularNotchedRectangle(),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.lightBlue),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        billingitems.clear();
                                        billingquantity.clear();
                                        billingprice.clear();
                                        kotitems.clear();
                                        kotquantity.clear();
                                      });
                                    },
                                    child: Text("Clear",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600))),
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white),
                                        onPressed: () {},
                                        child: Text("KOT",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600))),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width: 192,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white),
                                          onPressed: () {
                                            foodsearch.clear();
                                            setState(() {});
                                            Fluttertoast.cancel();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyCartCheckout(
                                                  itemlist: billingitems,
                                                  quantitylist: billingquantity,
                                                  pricelist: billingprice,
                                                  kotitems: kotitems,
                                                  kotquantity: kotquantity,
                                                  clearListCallback: clear,
                                                  useruid: useruid,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text("Checkout",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ),
                                    SizedBox(width: 10)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Image.network(
                    "https://static.vecteezy.com/system/resources/previews/023/914/428/non_2x/no-document-or-data-found-ui-illustration-design-free-vector.jpg",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  )),
        onRefresh: () {
          return getmethod();
        },
      ),
    );
  }
}
