import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class MyPrint extends StatefulWidget {
  @override
  _MyPrintState createState() => _MyPrintState();
}

class _MyPrintState extends State<MyPrint> {
  List items = ["Pavbhaji", "Pulav", "Pizza"];
  List quantity = ["2", "3", "5"];
  List price = ["120", "150", "190"];
  @override
  void initState() {
    super.initState();
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

  Future<void> startPrint() async {
    try {
      CapabilityProfile profile = await CapabilityProfile.load();
      Generator generator = Generator(PaperSize.mm80, profile);

      List<int> bytes = [];

      bytes += generator.text("My First Printing",
          styles: const PosStyles(bold: true, underline: true));

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

      for (int i = 0; i < items.length - 1; i++) {
        bytes += generator.row([
          PosColumn(text: "${items[i]}", width: 3),
          PosColumn(text: "${quantity[i]}", width: 3),
          PosColumn(text: "${price[i]}", width: 3),
          PosColumn(
              text: "${int.parse(quantity[i]) * int.parse(price[i])}",
              width: 3),
        ]);
      }
      bytes += generator.row([
        PosColumn(text: "R2,Cell 4", width: 4),
        PosColumn(text: "R2,Cell 5", width: 4),
        PosColumn(text: "R2,Cell 6", width: 4),
      ]);
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
        title: Text("Print Receipt"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            initializePrinter();
            startPrint();
          },
          child: Text("Print Receipt"),
        ),
      ),
    );
  }
}
