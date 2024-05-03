import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos/Backend/Google-Services.dart';
import 'package:pos/Screen/DashBoard/login-page.dart';
import 'package:pos/Screen/Invoice-Generator/Billing.dart';
import 'package:pos/Screen/Products-Section/MyStore.dart';
import 'package:pos/Screen/Products-Section/New-Items.dart';

class MyMenuDrawer extends StatefulWidget {
  const MyMenuDrawer({super.key});

  @override
  State<MyMenuDrawer> createState() => _MyMenuDrawerState();
}

class _MyMenuDrawerState extends State<MyMenuDrawer> {
  GoogleServicesClass google_services = GoogleServicesClass();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 6, 18, 67),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                //Profile
              },
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                "Add Products",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                //Add Mare items
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewProductScreen(),
                    ));
              },
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                "View Products",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyBillgenerator(),
                    ));
              },
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                "Add Machines",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                //Add machins
              },
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                "View Receipts",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                "Log out",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
