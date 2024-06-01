import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SavingsTrackingScreen extends StatefulWidget {
  @override
  _SavingsTrackingScreenState createState() => _SavingsTrackingScreenState();
}

class _SavingsTrackingScreenState extends State<SavingsTrackingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  List<Map<String, dynamic>> _savings = [];

  final TextEditingController _savingsTypeController = TextEditingController();
  final TextEditingController _savingsForController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _loadSavingsData();
    }
  }

  Future<void> _loadSavingsData() async {
    if (_user == null) return;

    String userId = _user!.uid;
    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('expenses')
          .doc(userId)
          .collection(monthYear)
          .doc('savings')
          .get();

      if (userDoc.exists) {
        setState(() {
          _savings = List<Map<String, dynamic>>.from(userDoc['savings']);
        });
      }
    } catch (e) {
      print('Error loading savings data: $e');
    }
  }

  Future<void> _addSaving(
      String savingsType, String savingsFor, double amount, String date) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      _savings.add({
        'savingsType': savingsType,
        'savingsFor': savingsFor,
        'amount': amount,
        'date': date,
      });

      await _firestore
          .collection('expenses')
          .doc(_user!.uid)
          .collection(monthYear)
          .doc('savings')
          .set({
        'savings': _savings,
      });

      setState(() {});
    } catch (e) {
      print('Error adding saving: $e');
    }
  }

  void _showAddSavingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Saving Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _savingsTypeController,
                  decoration: InputDecoration(labelText: 'Savings Type'),
                ),
                TextField(
                  controller: _savingsForController,
                  decoration: InputDecoration(labelText: 'Savings For'),
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String savingsType = _savingsTypeController.text;
                String savingsFor = _savingsForController.text;
                double amount = double.tryParse(_amountController.text) ?? 0.0;
                String date = _dateController.text;

                if (savingsType.isNotEmpty &&
                    savingsFor.isNotEmpty &&
                    amount > 0 &&
                    date.isNotEmpty) {
                  _addSaving(savingsType, savingsFor, amount, date);
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
      appBar: AppBar(title: Text('Savings Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _savings.length,
                itemBuilder: (context, index) {
                  final saving = _savings[index];
                  return Card(
                    child: ListTile(
                      title: Text(saving['savingsType']),
                      subtitle: Text(
                          'Savings For: ${saving['savingsFor']}\nAmount: ${saving['amount']}\nDate: ${saving['date']}'),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _showAddSavingDialog,
              child: Text('Add Saving Details'),
            ),
          ],
        ),
      ),
    );
  }
}
