import 'package:flutter/material.dart';

class My2ndScreen extends StatefulWidget {
  const My2ndScreen({super.key});

  @override
  State<My2ndScreen> createState() => _My2ndScreenState();
}

class _My2ndScreenState extends State<My2ndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 90,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.orange, borderRadius: BorderRadius.only()),
              ),
              Container(
                height: 180,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
