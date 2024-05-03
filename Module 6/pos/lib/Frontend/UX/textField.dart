import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/Screen/DashBoard/dashboard.dart';

Widget textField(
    TextEditingController controller, String? hintText, String? labelText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: "$hintText",
      labelText: "$labelText",
      labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    ),
  );
}

Widget textField_withIcon(TextEditingController controller, String? hintText,
    String? labelText, bool showpassword, Icon icon, VoidCallback onPressed) {
  return TextField(
    obscureText: showpassword,
    controller: controller,
    decoration: InputDecoration(
      hintText: "$hintText",
      labelText: "$labelText",
      suffixIcon: IconButton(
        icon: icon,
        onPressed: onPressed, // Assign the onPressed callback to the IconButton
      ),
      labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    ),
  );
}

// ignore: camel_case_types


