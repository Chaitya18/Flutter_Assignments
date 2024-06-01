import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoanTrackingScreen extends StatefulWidget {
  @override
  _LoanTrackingScreenState createState() => _LoanTrackingScreenState();
}

class _LoanTrackingScreenState extends State<LoanTrackingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  double _loanAmount = 0.0;
  double _amountPaid = 0.0;
  List<Map<String, dynamic>> _installments = [];

  String _loanName = '';
  double _interestRate = 0.0;
  String _emiDate = '';
  int _tenure = 0;

  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _loadLoanData();
    }
  }

  Future<void> _loadLoanData() async {
    if (_user == null) return;
    String userId = _user!.uid;
    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    DocumentSnapshot userDoc = await _firestore
        .collection('expenses')
        .doc(userId)
        .collection(monthYear)
        .doc('loan')
        .get();

    if (userDoc.exists) {
      setState(() {
        _loanAmount = userDoc['loanAmount'];
        _amountPaid = userDoc['amountPaid'];
        _installments =
            List<Map<String, dynamic>>.from(userDoc['installments']);
        _loanName = userDoc['loanName'];
        _interestRate = userDoc['interestRate'];
        _emiDate = userDoc['emiDate'];
        _tenure = userDoc['tenure'];
      });
    }
  }

  Future<void> _addLoanDetails(String loanName, double loanAmount,
      double interestRate, String emiDate, int tenure) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    await _firestore
        .collection('expenses')
        .doc(_user!.uid)
        .collection(monthYear)
        .doc('loan')
        .set({
      'loanName': loanName,
      'loanAmount': loanAmount,
      'amountPaid': 0.0,
      'installments': [],
      'interestRate': interestRate,
      'emiDate': emiDate,
      'tenure': tenure,
    });

    setState(() {
      _loanName = loanName;
      _loanAmount = loanAmount;
      _amountPaid = 0.0;
      _installments = [];
      _interestRate = interestRate;
      _emiDate = emiDate;
      _tenure = tenure;
    });
  }

  Future<void> _addInstallment(double amount) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';
    String date = '${now.day}-${now.month}-${now.year}';
    String time = '${now.hour}:${now.minute}';

    _installments.add({
      'amount': amount,
      'date': date,
      'time': time,
    });

    _amountPaid += amount;

    await _firestore
        .collection('expenses')
        .doc(_user!.uid)
        .collection(monthYear)
        .doc('loan')
        .set({
      'loanAmount': _loanAmount,
      'amountPaid': _amountPaid,
      'installments': _installments,
      'loanName': _loanName,
      'interestRate': _interestRate,
      'emiDate': _emiDate,
      'tenure': _tenure,
    });

    if (_amountPaid > _loanAmount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Amount paid exceeds loan amount!')),
      );
    } else if (_amountPaid < _loanAmount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Amount paid is less than loan amount!')),
      );
    }

    setState(() {});
  }

  void _showAddLoanDialog() {
    final TextEditingController loanNameController = TextEditingController();
    final TextEditingController loanAmountController = TextEditingController();
    final TextEditingController interestRateController =
        TextEditingController();
    final TextEditingController emiDateController = TextEditingController();
    final TextEditingController tenureController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Loan Details'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: loanNameController,
                  decoration: InputDecoration(labelText: 'Loan Name'),
                ),
                TextField(
                  controller: loanAmountController,
                  decoration: InputDecoration(labelText: 'Loan Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: interestRateController,
                  decoration: InputDecoration(labelText: 'Interest Rate (%)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: emiDateController,
                  decoration:
                      InputDecoration(labelText: 'EMI Date (dd/mm/yyyy)'),
                ),
                TextField(
                  controller: tenureController,
                  decoration: InputDecoration(labelText: 'Tenure (in years)'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String loanName = loanNameController.text;
                double loanAmount =
                    double.tryParse(loanAmountController.text) ?? 0.0;
                double interestRate =
                    double.tryParse(interestRateController.text) ?? 0.0;
                String emiDate = emiDateController.text;
                int tenure = int.tryParse(tenureController.text) ?? 0;

                if (loanName.isNotEmpty &&
                    loanAmount > 0 &&
                    interestRate > 0 &&
                    emiDate.isNotEmpty &&
                    tenure > 0) {
                  _addLoanDetails(
                      loanName, loanAmount, interestRate, emiDate, tenure);
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
      appBar: AppBar(title: Text('Loan Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Loan Name: $_loanName', style: TextStyle(fontSize: 20)),
            Text('Loan Amount: \$$_loanAmount', style: TextStyle(fontSize: 20)),
            Text('Amount Paid: \$$_amountPaid', style: TextStyle(fontSize: 20)),
            Text('Interest Rate: $_interestRate%',
                style: TextStyle(fontSize: 20)),
            Text('EMI Date: $_emiDate', style: TextStyle(fontSize: 20)),
            Text('Tenure: $_tenure years', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _installments.length,
                itemBuilder: (context, index) {
                  final installment = _installments[index];
                  return ListTile(
                    title: Text('Amount: \$${installment['amount']}'),
                    subtitle: Text(
                        'Date: ${installment['date']} \nTime: ${installment['time']}'),
                  );
                },
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Installment Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(_amountController.text) ?? 0.0;
                if (amount > 0) {
                  _addInstallment(amount);
                  _amountController.clear();
                }
              },
              child: Text('Add Installment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showAddLoanDialog,
              child: Text('Add Loan Details'),
            ),
          ],
        ),
      ),
    );
  }
}
