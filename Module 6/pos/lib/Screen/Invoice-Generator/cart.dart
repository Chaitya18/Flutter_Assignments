import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class MyCartCheckout extends StatefulWidget {
  MyCartCheckout(
      {Key? key,
      required this.itemlist,
      required this.quantitylist,
      required this.pricelist,
      required this.kotitems,
      required this.kotquantity,
      required this.clearListCallback,
      required this.useruid})
      : super(key: key);

  final List<String> itemlist;
  final List kotitems;
  final List kotquantity;

  final List<dynamic> quantitylist;
  final List<dynamic> pricelist;
  final VoidCallback clearListCallback;

  dynamic useruid;
  @override
  State<MyCartCheckout> createState() => _MyCartCheckoutState();
}

class _MyCartCheckoutState extends State<MyCartCheckout> {
  dynamic totalamount = 0;
  bool nodata = false;
  dynamic modeofpayment = '';
  bool? cash = false;
  bool? online = false;
  DateTime now = DateTime.now();
  dynamic todaysdate = "";
  dynamic id = 0;
  dynamic qrdata = "";
  @override
  void initState() {
    super.initState();
    calculateTotal();
    setState(() {
      todaysdate = "${now.day}-${now.month}-${now.year}";
    });
  }

  Future<void> GenerateBill() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("Receipt")
        .doc(widget.useruid)
        .collection(todaysdate)
        .get();

    int maxId = 0; // Initialize maxId variable to store the maximum ID found
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((document) {
        var data = document.data();
        if (data != null) {
          int currentId = data["Receipt id"];
          if (currentId > maxId) {
            maxId = currentId; // Update maxId if a higher ID is found
          }
        }
      });
    }
    id = maxId + 1;
    billprint(id);
    await FirebaseFirestore.instance
        .collection("Receipt")
        .doc(widget.useruid)
        .collection(todaysdate)
        .doc("$id")
        .set({
      "Receipt id": id,
      "Items": widget.itemlist,
      "Quantity": widget.quantitylist,
      "Price": widget.pricelist,
      "Mode of Payment": modeofpayment,
      "Total": totalamount,
      "Bill Time": "${now.hour}:${now.minute}:${now.second}"
    });

    setState(() {
      modeofpayment = "";
    });
  }

  void calculateTotal() {
    if (widget.itemlist.isEmpty) {
      setState(() {
        nodata = true;
      });
    }
    dynamic total = 0;
    for (int i = 0; i < widget.itemlist.length; i++) {
      total +=
          widget.quantitylist[i] * int.parse(widget.pricelist[i].toString());
    }
    setState(() {
      totalamount = total;
    });
  }

  Future<void> billprint(dynamic billid) async {
    try {
      CapabilityProfile profile = await CapabilityProfile.load();
      Generator generator = Generator(PaperSize.mm80, profile);

      List<int> bytes = [];
      bytes += generator.hr();
      bytes += generator.text("POINT OF SALE",
          styles: const PosStyles(
              bold: true, width: PosTextSize.size2, align: PosAlign.center));
      bytes += generator.hr();
      bytes += generator.text(
          "A FINAL YEAR PROJECT DEVELOPED BY THE STUDENTS OF RC TECHNICAL IINSTITUTE",
          styles: const PosStyles(align: PosAlign.center));
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(text: "Date: ${todaysdate}", width: 6),
        PosColumn(text: "", width: 3),
        PosColumn(text: "", width: 3),
      ]);
      bytes += generator.row([
        PosColumn(
            text: "Time: ${now.hour}:${now.minute}:${now.second}", width: 6),
        PosColumn(text: "", width: 3),
        PosColumn(text: "", width: 3),
      ]);
      bytes += generator.row([
        PosColumn(text: "MOD: $modeofpayment", width: 6),
        PosColumn(text: "", width: 3),
        PosColumn(text: "", width: 3),
      ]);
      bytes += generator.row([
        PosColumn(text: "ID: $billid", width: 6),
        PosColumn(text: "", width: 3),
        PosColumn(text: "", width: 3),
      ]);
      bytes += generator.hr();

      bytes += generator.row([
        PosColumn(
            text: "Item",
            width: 3,
            styles: PosStyles(bold: true, underline: false)),
        PosColumn(
            text: "Quantity",
            width: 3,
            styles: PosStyles(bold: true, underline: false)),
        PosColumn(
            text: "Price",
            width: 3,
            styles: PosStyles(bold: true, underline: false)),
        PosColumn(
            text: "Total",
            width: 3,
            styles: PosStyles(bold: true, underline: false)),
      ]);

      bytes += generator.hr();

      for (int i = 0; i < widget.itemlist.length; i++) {
        // Convert string values to num for calculations
        num quantity = num.parse(widget.quantitylist[i].toString());
        num price = num.parse(widget.pricelist[i].toString());
        num product = quantity * price;

        bytes += generator.row([
          PosColumn(text: "${widget.itemlist[i]}", width: 3),
          PosColumn(text: quantity.toString(), width: 3),
          PosColumn(text: price.toString(), width: 3),
          PosColumn(text: product.toString(), width: 3),
        ]);
      }

      // Convert totalamount to string for PosColumn
      bytes += generator.hr();

      bytes += generator.row([
        PosColumn(text: "", width: 5),
        PosColumn(text: "", width: 1),
        PosColumn(text: "", width: 1),
        PosColumn(text: "Total: $totalamount", width: 5),
      ]);
      bytes += generator.hr();

      bytes += generator.text('\n\n\n');

      await PrintBluetoothThermal.writeBytes(bytes);
      widget.clearListCallback();
      modeofpayment == "";
      Navigator.pop(context);
      Future.delayed(Duration(seconds: 2));
    } catch (e) {
      print('Error printing receipt: $e');
    }
  }

  Future<void> kotprint() async {
    try {
      CapabilityProfile profile = await CapabilityProfile.load();
      Generator generator = Generator(PaperSize.mm80, profile);

      List<int> bytes = [];
      bytes += generator.hr();
      bytes += generator.text("POINT OF SALE",
          styles: const PosStyles(
              bold: true, width: PosTextSize.size2, align: PosAlign.center));
      bytes += generator.hr();
      bytes += generator.text(
          "A FINAL YEAR PROJECT CREATED BY THE STUDENTS OF RC TECHNICAL IINSTITUTE",
          styles: const PosStyles(align: PosAlign.center));
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(text: "Date: ${todaysdate}", width: 6),
        PosColumn(text: "", width: 3),
        PosColumn(text: "", width: 3),
      ]);
      bytes += generator.row([
        PosColumn(
            text: "Time: ${now.hour}:${now.minute}:${now.second}", width: 6),
        PosColumn(text: "", width: 3),
        PosColumn(text: "", width: 3),
      ]);
      bytes += generator.row([
        PosColumn(text: "Bill Token : ", width: 6),
        PosColumn(text: "", width: 3),
        PosColumn(text: "", width: 3),
      ]);
      bytes += generator.hr();

      bytes += generator.row([
        PosColumn(
            text: "Item",
            width: 6,
            styles: PosStyles(bold: true, underline: false)),
        PosColumn(
            text: "Quantity",
            width: 6,
            styles: PosStyles(bold: true, underline: false)),
      ]);

      bytes += generator.hr();

      for (int i = 0; i < widget.itemlist.length; i++) {
        // Convert string values to num for calculations
        num quantity = num.parse(widget.quantitylist[i].toString());

        bytes += generator.row([
          PosColumn(text: "${widget.itemlist[i]}", width: 6),
          PosColumn(text: quantity.toString(), width: 6),
        ]);
      }

      // Convert totalamount to string for PosColumn
      bytes += generator.hr();

      bytes += generator.text('\n\n\n');

      await PrintBluetoothThermal.writeBytes(bytes);
    } catch (e) {
      print('Error printing receipt: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Bill Summary",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w600)),
          actions: [
            Container(
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            cash == false ? Colors.white : Colors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          cash = true;
                          online = false;
                          modeofpayment = "Cash";
                          print("$modeofpayment");
                          ;
                        });
                      },
                      child: Text(
                        "Cash",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              online == false ? Colors.white : Colors.green),
                      onPressed: () {
                        setState(() {
                          if (cash == true) {
                            cash = false;
                            online = true;
                            modeofpayment = "Online";
                            print("$modeofpayment");
                          } else {
                            online = true;
                            modeofpayment = "Online";
                            print("$modeofpayment");
                          }
                          ;
                        });
                      },
                      child: Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(width: 3),
                ],
              ),
            ),
          ]),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              nodata == false
                  ? Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: widget.itemlist.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text("${widget.itemlist[index]}"),
                              title: Text("Price : ${widget.pricelist[index]}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (widget.quantitylist[index] > 0) {
                                          widget.quantitylist[index]--;
                                          widget.kotquantity[index]--;
                                          calculateTotal();
                                        }

                                        if (widget.quantitylist[index] == 0) {
                                          widget.itemlist.removeAt(index);
                                          widget.quantitylist.removeAt(index);
                                          widget.pricelist.removeAt(index);
                                          widget.kotitems.removeAt(index);
                                          widget.kotquantity.removeAt(index);
                                          calculateTotal();
                                          widget.clearListCallback;
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    "${widget.quantitylist[index]}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        totalamount = 0;
                                        widget.quantitylist[index]++;
                                        widget.kotquantity[index]++;
                                        calculateTotal();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Container(
                      height: 613,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkYzeexPAm-h2Q3x4hWVaGwN96M7OeISuDPBZk7Xzmog&s"))),
                    ),
              BottomAppBar(
                shape: CircularNotchedRectangle(),
                child: Container(
                  decoration: BoxDecoration(color: Colors.lightBlue),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text("Total : ₹$totalamount",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600)),
                        title: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              if (widget.itemlist.isEmpty) {
                                Fluttertoast.showToast(msg: "Select Items");
                              } else {
                                if (modeofpayment == "") {
                                  Fluttertoast.showToast(
                                      msg: "Select Payment Method");
                                } else {
                                  GenerateBill();
                                }
                              }
                            },
                            child: Text("Print",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600))),
                        trailing: Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                kotprint();
                              },
                              child: Text("KOT",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
