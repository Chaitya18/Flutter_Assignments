// ignore_for_file: must_be_immutable, annotate_overrides

import 'package:budget_app/screen/add_expense.dart';
import 'package:budget_app/screen/investments.dart';
import 'package:budget_app/screen/mutual_funds.dart';
import 'package:budget_app/screen/savings.dart';
import 'package:budget_app/screen/stock_portfolio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  MyDashboard({super.key, this.user});
  User? user;
  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  String? name;
  List<String> images = [
    "loan.png",
    "monthly_expense.png",
    "Savings.png",
    "mutual-funds.png",
    "stock-portfolio.png",
    "investments.png"
  ];
  int currentindex = 0;
  List<Widget> pages = [
    LoanTrackingScreen(),
    AddExpense(),
    SavingsTrackingScreen(),
    MutualFundTrackingScreen(),
    StockMarketTrackingScreen(),
    InvestmentTrackingScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height * 28) / 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.menu,
                          color: Colors.black,
                          weight: double.maxFinite,
                        ),
                        trailing: Icon(
                          Icons.person,
                          color: Colors.black,
                          weight: double.maxFinite,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          "Hi, Chaitya Tejas Shah",
                          style: TextStyle(fontSize: 36),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 25) / 100,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.height * 75) / 100,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Container(
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 25,
                                children: List.generate(images.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/${images[index]}")),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          currentindex = index;
                                        });
                                        if (currentindex >= 0 &&
                                            currentindex < pages.length) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  pages[currentindex],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
