import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _modeOfPaymentController =
      TextEditingController();

  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Expense Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an expense title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? _selectedDate!.toLocal().toString().split(' ')[0]
                        : '',
                  ),
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (_selectedDate == null) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _modeOfPaymentController,
                  decoration: InputDecoration(labelText: 'Mode of Payment'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mode of payment';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _saveExpense();
                    }
                  },
                  child: Text('Save Expense'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveExpense() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle unauthenticated user
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('User not authenticated')));
      return;
    }

    String monthYear = "${_selectedDate!.month}-${_selectedDate!.year}";

    CollectionReference expenses = FirebaseFirestore.instance
        .collection('Expenses')
        .doc(user.uid)
        .collection(monthYear);

    try {
      await expenses.doc().set({
        'title': _titleController.text,
        'price': double.parse(_priceController.text),
        'date': _selectedDate,
        'description': _descriptionController.text,
        'mode_of_payment': _modeOfPaymentController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Expense added successfully')));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}
