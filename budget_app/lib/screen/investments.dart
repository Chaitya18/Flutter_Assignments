import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InvestmentTrackingScreen extends StatefulWidget {
  @override
  _InvestmentTrackingScreenState createState() =>
      _InvestmentTrackingScreenState();
}

class _InvestmentTrackingScreenState extends State<InvestmentTrackingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  List<Map<String, dynamic>> _investments = [];

  final TextEditingController _investmentTypeController =
      TextEditingController();
  final TextEditingController _qualityController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _buyerNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _loadInvestmentData();
    }
  }

  Future<void> _loadInvestmentData() async {
    if (_user == null) return;

    String userId = _user!.uid;
    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('expenses')
          .doc(userId)
          .collection(monthYear)
          .doc('investments')
          .get();

      if (userDoc.exists) {
        setState(() {
          _investments =
              List<Map<String, dynamic>>.from(userDoc['investments']);
        });
      }
    } catch (e) {
      print('Error loading investment data: $e');
    }
  }

  Future<void> _addInvestment(String investmentType, String quality,
      int quantity, double amount, String date, String buyerName) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      _investments.add({
        'investmentType': investmentType,
        'quality': quality,
        'quantity': quantity,
        'amount': amount,
        'date': date,
        'buyerName': buyerName,
      });

      await _firestore
          .collection('expenses')
          .doc(_user!.uid)
          .collection(monthYear)
          .doc('investments')
          .set({
        'investments': _investments,
      });

      setState(() {});
    } catch (e) {
      print('Error adding investment: $e');
    }
  }

  void _showAddInvestmentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Investment Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _investmentTypeController,
                  decoration: InputDecoration(labelText: 'Investment Type'),
                ),
                TextField(
                  controller: _qualityController,
                  decoration: InputDecoration(labelText: 'Quality'),
                ),
                TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _buyerNameController,
                  decoration: InputDecoration(labelText: 'Buyer Name'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String investmentType = _investmentTypeController.text;
                String quality = _qualityController.text;
                int quantity = int.tryParse(_quantityController.text) ?? 0;
                double amount = double.tryParse(_amountController.text) ?? 0.0;
                String date = _dateController.text;
                String buyerName = _buyerNameController.text;

                if (investmentType.isNotEmpty &&
                    quality.isNotEmpty &&
                    quantity > 0 &&
                    amount > 0 &&
                    date.isNotEmpty &&
                    buyerName.isNotEmpty) {
                  _addInvestment(investmentType, quality, quantity, amount,
                      date, buyerName);
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
      appBar: AppBar(title: Text('Investment Portfolio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _investments.length,
                itemBuilder: (context, index) {
                  final investment = _investments[index];
                  return Card(
                    child: ListTile(
                      title: Text(investment['investmentType']),
                      subtitle: Text(
                          'Quality: ${investment['quality']}\nQuantity: ${investment['quantity']}\nAmount: ${investment['amount']}\nDate: ${investment['date']}\nBuyer Name: ${investment['buyerName']}'),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _showAddInvestmentDialog,
              child: Text('Add Investment Details'),
            ),
          ],
        ),
      ),
    );
  }
}
