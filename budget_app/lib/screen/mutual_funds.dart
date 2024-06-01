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
  List<Map<String, dynamic>> _loans = [];

  final TextEditingController _loanNameController = TextEditingController();
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _emiDateController = TextEditingController();
  final TextEditingController _tenureController = TextEditingController();
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
        .doc('loans')
        .get();

    if (userDoc.exists) {
      setState(() {
        _loans = List<Map<String, dynamic>>.from(userDoc['loans']);
      });
    }
  }

  Future<void> _addLoan(String loanName, double loanAmount, double interestRate,
      String emiDate, int tenure) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    _loans.add({
      'loanName': loanName,
      'loanAmount': loanAmount,
      'interestRate': interestRate,
      'emiDate': emiDate,
      'tenure': tenure,
      'installments': [],
    });

    await _firestore
        .collection('expenses')
        .doc(_user!.uid)
        .collection(monthYear)
        .doc('loans')
        .set({
      'loans': _loans,
    });

    setState(() {});
  }

  Future<void> _addInstallment(double amount) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    if (_loans.isNotEmpty) {
      _loans[0]['installments'].add({
        'amount': amount,
        'date': now.toIso8601String(),
      });

      await _firestore
          .collection('expenses')
          .doc(_user!.uid)
          .collection(monthYear)
          .doc('loans')
          .set({
        'loans': _loans,
      });

      setState(() {});
    }
  }

  void _showAddLoanDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Loan Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _loanNameController,
                decoration: InputDecoration(labelText: 'Loan Name'),
              ),
              TextField(
                controller: _loanAmountController,
                decoration: InputDecoration(labelText: 'Loan Amount'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _interestRateController,
                decoration: InputDecoration(labelText: 'Interest Rate'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _emiDateController,
                decoration: InputDecoration(labelText: 'EMI Date'),
              ),
              TextField(
                controller: _tenureController,
                decoration: InputDecoration(labelText: 'Tenure (months)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                String loanName = _loanNameController.text;
                double loanAmount =
                    double.tryParse(_loanAmountController.text) ?? 0.0;
                double interestRate =
                    double.tryParse(_interestRateController.text) ?? 0.0;
                String emiDate = _emiDateController.text;
                int tenure = int.tryParse(_tenureController.text) ?? 0;

                if (loanName.isNotEmpty &&
                    loanAmount > 0 &&
                    interestRate > 0 &&
                    emiDate.isNotEmpty &&
                    tenure > 0) {
                  _addLoan(loanName, loanAmount, interestRate, emiDate, tenure);
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
            Expanded(
              child: ListView.builder(
                itemCount: _loans.length,
                itemBuilder: (context, index) {
                  final loan = _loans[index];
                  return Card(
                    child: ListTile(
                      title: Text(loan['loanName']),
                      subtitle: Text(
                          'Amount: ${loan['loanAmount']}, Interest Rate: ${loan['interestRate']}%'),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _showAddLoanDialog,
              child: Text('Add Loan Details'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Installment Amount'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(_amountController.text) ?? 0.0;
                if (amount > 0) {
                  _addInstallment(amount);
                }
              },
              child: Text('Add Installment'),
            ),
          ],
        ),
      ),
    );
  }
}

class MutualFundTrackingScreen extends StatefulWidget {
  @override
  _MutualFundTrackingScreenState createState() =>
      _MutualFundTrackingScreenState();
}

class _MutualFundTrackingScreenState extends State<MutualFundTrackingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  List<Map<String, dynamic>> _mutualFunds = [];

  final TextEditingController _schemeNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _investorNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nominee1Controller = TextEditingController();
  final TextEditingController _share1Controller = TextEditingController();
  final TextEditingController _nominee2Controller = TextEditingController();
  final TextEditingController _share2Controller = TextEditingController();
  final TextEditingController _nominee3Controller = TextEditingController();
  final TextEditingController _share3Controller = TextEditingController();
  final TextEditingController _optionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _loadMutualFundData();
    }
  }

  Future<void> _loadMutualFundData() async {
    if (_user == null) return;

    String userId = _user!.uid;
    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('expenses')
          .doc(userId)
          .collection(monthYear)
          .doc('mutualFunds')
          .get();

      if (userDoc.exists) {
        setState(() {
          _mutualFunds =
              List<Map<String, dynamic>>.from(userDoc['mutualFunds']);
        });
      }
    } catch (e) {
      print('Error loading mutual fund data: $e');
    }
  }

  Future<void> _addMutualFund(
      String schemeName,
      double amount,
      String investorName,
      String date,
      String nominee1,
      double share1,
      String nominee2,
      double share2,
      String nominee3,
      double share3,
      String option) async {
    if (_user == null) return;

    DateTime now = DateTime.now();
    String monthYear = '${now.month}-${now.year}';

    try {
      _mutualFunds.add({
        'schemeName': schemeName,
        'amount': amount,
        'investorName': investorName,
        'date': date,
        'nominee1': nominee1,
        'share1': share1,
        'nominee2': nominee2,
        'share2': share2,
        'nominee3': nominee3,
        'share3': share3,
        'option': option,
      });

      await _firestore
          .collection('expenses')
          .doc(_user!.uid)
          .collection(monthYear)
          .doc('mutualFunds')
          .set({
        'mutualFunds': _mutualFunds,
      });

      setState(() {});
    } catch (e) {
      print('Error adding mutual fund: $e');
    }
  }

  void _showAddMutualFundDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Mutual Fund Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _schemeNameController,
                  decoration: InputDecoration(labelText: 'Scheme Name'),
                ),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _investorNameController,
                  decoration: InputDecoration(labelText: 'Investor Name'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _nominee1Controller,
                  decoration: InputDecoration(labelText: 'Nominee 1'),
                ),
                TextField(
                  controller: _share1Controller,
                  decoration: InputDecoration(labelText: 'Share 1 (%)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _nominee2Controller,
                  decoration: InputDecoration(labelText: 'Nominee 2'),
                ),
                TextField(
                  controller: _share2Controller,
                  decoration: InputDecoration(labelText: 'Share 2 (%)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _nominee3Controller,
                  decoration: InputDecoration(labelText: 'Nominee 3'),
                ),
                TextField(
                  controller: _share3Controller,
                  decoration: InputDecoration(labelText: 'Share 3 (%)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _optionController,
                  decoration: InputDecoration(labelText: 'Option'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String schemeName = _schemeNameController.text;
                double amount = double.tryParse(_amountController.text) ?? 0.0;
                String investorName = _investorNameController.text;
                String date = _dateController.text;
                String nominee1 = _nominee1Controller.text;
                double share1 = double.tryParse(_share1Controller.text) ?? 0.0;
                String nominee2 = _nominee2Controller.text;
                double share2 = double.tryParse(_share2Controller.text) ?? 0.0;
                String nominee3 = _nominee3Controller.text;
                double share3 = double.tryParse(_share3Controller.text) ?? 0.0;
                String option = _optionController.text;

                if (schemeName.isNotEmpty &&
                    amount > 0 &&
                    investorName.isNotEmpty &&
                    date.isNotEmpty) {
                  _addMutualFund(
                      schemeName,
                      amount,
                      investorName,
                      date,
                      nominee1,
                      share1,
                      nominee2,
                      share2,
                      nominee3,
                      share3,
                      option);
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
      appBar: AppBar(title: Text('Mutual Fund Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _mutualFunds.length,
                itemBuilder: (context, index) {
                  final mutualFund = _mutualFunds[index];
                  return Card(
                    child: ListTile(
                      title: Text(mutualFund['schemeName']),
                      subtitle: Text(
                          'Amount: ${mutualFund['amount']}, Investor: ${mutualFund['investorName']}'),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _showAddMutualFundDialog,
              child: Text('Add Mutual Fund Details'),
            ),
          ],
        ),
      ),
    );
  }
}
