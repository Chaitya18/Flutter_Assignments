import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StockMarketTrackingScreen extends StatefulWidget {
  @override
  _StockMarketTrackingScreenState createState() =>
      _StockMarketTrackingScreenState();
}

class _StockMarketTrackingScreenState extends State<StockMarketTrackingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  List<Map<String, dynamic>> _stocks = [];

  final TextEditingController _accountBeneficiaryController =
      TextEditingController();
  final TextEditingController _accountHolderController =
      TextEditingController();
  final TextEditingController _stockCompanyController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _loadStockData();
    }
  }

  Future<void> _loadStockData() async {
    if (_user == null) return;

    String userId = _user!.uid;
    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('expenses')
          .doc(userId)
          .collection(monthYear)
          .doc('stocks')
          .get();

      if (userDoc.exists) {
        setState(() {
          _stocks = List<Map<String, dynamic>>.from(userDoc['stocks']);
        });
      }
    } catch (e) {
      print('Error loading stock data: $e');
    }
  }

  Future<void> _addStock(
      String accountBeneficiary,
      String accountHolder,
      String stockCompany,
      int quantity,
      double price,
      double totalAmount,
      String dateTime) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      _stocks.add({
        'accountBeneficiary': accountBeneficiary,
        'accountHolder': accountHolder,
        'stockCompany': stockCompany,
        'quantity': quantity,
        'price': price,
        'totalAmount': totalAmount,
        'dateTime': dateTime,
      });

      await _firestore
          .collection('expenses')
          .doc(_user!.uid)
          .collection(monthYear)
          .doc('stocks')
          .set({
        'stocks': _stocks,
      });

      setState(() {});
    } catch (e) {
      print('Error adding stock: $e');
    }
  }

  void _showAddStockDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Stock Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _accountBeneficiaryController,
                  decoration:
                      InputDecoration(labelText: 'Account Beneficiary Number'),
                ),
                TextField(
                  controller: _accountHolderController,
                  decoration: InputDecoration(labelText: 'Account Holder Name'),
                ),
                TextField(
                  controller: _stockCompanyController,
                  decoration: InputDecoration(labelText: 'Stock Company'),
                ),
                TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _priceController,
                  decoration:
                      InputDecoration(labelText: 'Per Share Buying Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _totalAmountController,
                  decoration: InputDecoration(labelText: 'Total Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _dateTimeController,
                  decoration: InputDecoration(labelText: 'Date with Time'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String accountBeneficiary = _accountBeneficiaryController.text;
                String accountHolder = _accountHolderController.text;
                String stockCompany = _stockCompanyController.text;
                int quantity = int.tryParse(_quantityController.text) ?? 0;
                double price = double.tryParse(_priceController.text) ?? 0.0;
                double totalAmount =
                    double.tryParse(_totalAmountController.text) ?? 0.0;
                String dateTime = _dateTimeController.text;

                if (accountBeneficiary.isNotEmpty &&
                    accountHolder.isNotEmpty &&
                    stockCompany.isNotEmpty &&
                    quantity > 0 &&
                    price > 0 &&
                    totalAmount > 0 &&
                    dateTime.isNotEmpty) {
                  _addStock(accountBeneficiary, accountHolder, stockCompany,
                      quantity, price, totalAmount, dateTime);
                }

                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stock Market Portfolio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _stocks.length,
                itemBuilder: (context, index) {
                  final stock = _stocks[index];
                  return Card(
                    child: ListTile(
                      title: Text(stock['stockCompany']),
                      subtitle: Text(
                          'Account Holder: ${stock['accountHolder']}\nQuantity: ${stock['quantity']}\nPrice: ${stock['price']}\nTotal Amount: ${stock['totalAmount']}\nDate: ${stock['dateTime']}'),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _showAddStockDialog,
              child: Text('Add Stock Details'),
            ),
          ],
        ),
      ),
    );
  }
}
