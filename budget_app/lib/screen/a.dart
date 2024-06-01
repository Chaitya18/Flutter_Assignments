import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Add this package for charts

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Accounts section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AccountCard(
                    title: 'Cash', amount: '£1213.99', color: Colors.blue),
                AccountCard(
                    title: 'Bank', amount: '£2311.45', color: Colors.green),
                AccountCard(
                    title: 'Savings', amount: '£1800.00', color: Colors.purple),
              ],
            ),
            SizedBox(height: 20),
            // Expenses structure
            ExpensesStructure(),
            SizedBox(height: 20),
            // Recent records
            RecentRecords(),
          ],
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  AccountCard({required this.title, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              amount,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpensesStructure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        height: 200,
        child: Column(
          children: [
            Text('Expenses structure',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 40,
                      color: Colors.blue,
                      title: '40%',
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: Colors.red,
                      title: '30%',
                    ),
                    PieChartSectionData(
                      value: 20,
                      color: Colors.green,
                      title: '20%',
                    ),
                    PieChartSectionData(
                      value: 10,
                      color: Colors.yellow,
                      title: '10%',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text('Last records overview',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.food_bank, color: Colors.white),
              ),
              title: Text('Food'),
              subtitle: Text('£25.00'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.directions_car, color: Colors.white),
              ),
              title: Text('Transport'),
              subtitle: Text('£15.00'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.shopping_cart, color: Colors.white),
              ),
              title: Text('Shopping'),
              subtitle: Text('£150.00'),
            ),
          ],
        ),
      ),
    );
  }
}
